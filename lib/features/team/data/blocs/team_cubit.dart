import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/team/data/models/user_team_model.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'team_cubit.freezed.dart';
part 'team_cubit.g.dart';

@freezed
class TeamState with _$TeamState {
  const factory TeamState({
    UserTeam? team,
    @Default(false) bool isLoading,
    String? pickedImagePath,
  }) = _TeamState;

  factory TeamState.fromJson(Map<String, dynamic> json) =>
      _$TeamStateFromJson(json);
}

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(const TeamState());

  ApiClient? _apiClient;

  void initialize({required ApiClient apiClient}) {
    ///Checking if already initialized
    if (_apiClient != null) {
      return;
    }

    _apiClient = apiClient;
  }

  Future<String> createTeam(String name) async {
    Document? document = await _apiClient?.databases.createDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kTeamsCollection,
      documentId: ID.unique(),
      data: {
        'name': name,
        'admin': AuthCubit.instance.state.user!.id,
      },
    );

    if (document == null) {
      throw Exception('Error creating team');
    }

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
  }
}
