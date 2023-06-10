import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/team/data/models/user_team_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_cubit.freezed.dart';
part 'team_cubit.g.dart';

@freezed
class TeamState with _$TeamState {
  const factory TeamState({
    UserTeam? team,
    @Default(false) bool isLoading,
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
}
