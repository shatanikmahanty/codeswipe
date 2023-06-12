import 'package:appwrite/appwrite.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/home/data/models/hackathon_model.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../app/data/api_client.dart';

part 'hackathon_cubit.freezed.dart';d.dart';

part 'hackathon_cubit.g.dart';

@freezed
class HackathonState with _$HackathonState {
  const factory HackathonState({
    @Default([]) List<HackathonModel> hackathons,
    @Default(false) bool isLoading,
  }) = _HackathonState;

  factory HackathonState.fromJson(Map<String, dynamic> json) =>
      _$HackathonStateFromJson(json);
}

class HackathonCubit extends HydratedCubit<HackathonState> {
  HackathonCubit() : super(const HackathonState());

  Databases? _database;

  void initialize(ApiClient apiClient) {
    if (_database != null) {
      return;
    }
    _database = apiClient.databases;
  }

  Future<void> loadHackathons() async {
    emit(state.copyWith(isLoading: true));

    try {
      final documents = await _database!.listDocuments(
        collectionId: kHackathonsCollection,
        databaseId: EnvironmentHelper().getDatabaseId(),
        queries: [],
      );

      final models = documents.documents
          .map<HackathonModel>((doc) => HackathonModel.fromJson(doc.data))
          .toList();

      emit(state.copyWith(hackathons: models));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  @override
  HackathonState? fromJson(Map<String, dynamic> json) =>
      HackathonState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(HackathonState state) => state.toJson();
}
