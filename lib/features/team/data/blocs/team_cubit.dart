import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/team/data/models/user_team_model.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:codeswipe/utils/mixins/cubit_maybe_emit_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../models/team_vacancy_model.dart';

part 'team_cubit.freezed.dart';
part 'team_cubit.g.dart';

@freezed
class TeamState with _$TeamState {
  const factory TeamState({
    UserTeam? team,
    @Default([]) List<UserTeam> teams,
    @Default(false) bool isLoading,
    String? pickedImagePath,
    @Default([]) List<TeamVacancy> vacancies,
  }) = _TeamState;

  factory TeamState.fromJson(Map<String, dynamic> json) =>
      _$TeamStateFromJson(json);
}

class TeamCubit extends HydratedCubit<TeamState> with CubitMaybeEmit {
  TeamCubit() : super(const TeamState());

  ApiClient? _apiClient;

  void initialize({required ApiClient apiClient}) {
    ///Checking if already initialized
    if (_apiClient != null) {
      return;
    }

    _apiClient = apiClient;
  }

  Future<void> listTeams() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    final teamDocs = await _apiClient!.databases.listDocuments(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kTeamsCollection,
      queries: [
        if (state.team != null) Query.notEqual('\$id', state.team!.id),
      ],
    );

    emit(
      state.copyWith(
        teams: teamDocs.documents
            .map((team) => UserTeam.fromJson(team.data))
            .toList(),
        isLoading: false,
      ),
    );
  }

  Future<void> loadVacancies() async {
    emit(state.copyWith(isLoading: true));

    List<TeamVacancy> vacancies = [];

    final vacancyDoc = await _apiClient!.databases.listDocuments(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kTeamVacancyCollection,
    );

    vacancies = vacancyDoc.documents
        .map((vacancy) => TeamVacancy.fromJson(vacancy.data))
        .toList();

    emit(
      state.copyWith(
        isLoading: false,
        vacancies: vacancies,
      ),
    );
  }

  Future<void> loadUserTeam() async {
    emit(state.copyWith(isLoading: true));

    final teamId = AuthCubit.instance.state.user?.teamId ?? '';

    if (teamId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          team: null,
        ),
      );
      return;
    }

    final teamDoc = await _apiClient!.databases.getDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kTeamsCollection,
      documentId: teamId,
    );

    UserTeam userTeam = UserTeam.fromJson(teamDoc.data);

    List<AppUser> members = [];

    for (final String id in (userTeam.memberIDs ?? [])) {
      final userDoc = await _apiClient!.databases.getDocument(
        databaseId: EnvironmentHelper().getDatabaseId(),
        collectionId: kUsersCollection,
        documentId: id,
      );
      final teamMember = AppUser.fromJson(userDoc.data);
      members.add(teamMember);
    }

    userTeam = userTeam.copyWith(members: members);

    emit(
      state.copyWith(team: userTeam, isLoading: false),
    );
  }

  Future<String> createTeam(String name) async {
    final databases = _apiClient!.databases;
    final databaseId = EnvironmentHelper().getDatabaseId();
    final userId = AuthCubit.instance.state.user!.id;

    Document document = await databases.createDocument(
      databaseId: databaseId,
      collectionId: kTeamsCollection,
      documentId: ID.unique(),
      data: {
        'name': name,
        'admin': userId,
        'members': [userId],
      },
    );

    await databases.updateDocument(
      databaseId: databaseId,
      collectionId: kUsersCollection,
      documentId: userId,
      data: {
        'team_id': document.$id,
      },
    );

    AuthCubit.instance.updateUserTeamID(document.$id);

    await loadUserTeam();

    return document.$id;
  }

  void updatePickedPhoto(XFile file) {
    emit(
      state.copyWith(
        pickedImagePath: file.path,
      ),
    );
  }

  void clearPickedPhoto() {
    emit(
      state.copyWith(pickedImagePath: null),
    );
  }

  Future<void> uploadTeamImage(String teamID) async {
    await _apiClient!.storage.createFile(
      bucketId: EnvironmentHelper().getStorageBucketId(),
      file: InputFile.fromPath(
        path: state.pickedImagePath!,
        filename: 'team_image-$teamID',
      ),
      fileId: teamID,
    );

    emit(
      state.copyWith(
        pickedImagePath: null,
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(TeamState state) => state.toJson();

  @override
  TeamState? fromJson(Map<String, dynamic> json) {
    ///We don't want to persist these values
    json.remove('isLoading');
    return TeamState.fromJson(json);
  }

  Future<void> updateMemberRole(
      {required String teamId,
      required String memberId,
      required String role}) async {
    Map<String, dynamic>? memberRoles = Map.from(state.team!.memberRoles ?? {});

    if (memberRoles.isEmpty) {
      memberRoles = {
        memberId: role,
      };
    } else {
      memberRoles[memberId] = role;
    }

    final team = state.team!.copyWith(memberRoles: memberRoles);

    await _apiClient!.databases.updateDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kTeamsCollection,
      documentId: teamId,
      data: team.toJson(),
    );

    emit(
      state.copyWith(
        team: team,
      ),
    );
  }

  Future postVacancy(
    String position,
    String skills,
    String expectations,
  ) async {
    final teamVacancy = TeamVacancy(
      position: position,
      skills: skills,
      expectations: expectations,
      teamId: state.team!.id,
      createdAt: DateTime.now(),
      createdBy: AuthCubit.instance.state.user!.id,
      requests: [],
    );

    await _apiClient!.databases.createDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kTeamVacancyCollection,
      documentId: ID.unique(),
      data: teamVacancy.toJson(),
    );
  }
}
