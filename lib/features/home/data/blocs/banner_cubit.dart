import 'package:appwrite/appwrite.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/home/data/models/banner_model.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/data/api_client.dart';

part 'banner_cubit.freezed.dart';
part 'banner_cubit.g.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default([]) List<BannerModel> models,
    @Default(false) bool isLoading,
  }) = _BannerState;

  factory BannerState.fromJson(Map<String, dynamic> json) =>
      _$BannerStateFromJson(json);
}

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(const BannerState());

  Databases? _database;

  void initialize(ApiClient apiClient) {
    if (_database != null) {
      return;
    }
    _database = apiClient.databases;
  }

  Future<void> loadBanners() async {
    emit(state.copyWith(isLoading: true));

    try {
      final documents = await _database!.listDocuments(
        collectionId: kBannersCollection,
        databaseId: EnvironmentHelper().getDatabaseId(),
        queries: [
          Query.equal('active', true),
        ],
      );

      final models = documents.documents
          .map<BannerModel>((doc) => BannerModel.fromJson(doc.data))
          .toList();

      emit(state.copyWith(models: models));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
