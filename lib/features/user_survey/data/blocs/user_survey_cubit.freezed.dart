// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_survey_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSurveyState _$UserSurveyStateFromJson(Map<String, dynamic> json) {
  return _UserSurveyState.fromJson(json);
}

/// @nodoc
mixin _$UserSurveyState {
  List<String> get selectedSkills => throw _privateConstructorUsedError;
  List<String> get selectedHackathonThemes =>
      throw _privateConstructorUsedError;
  String? get selectedHackathonType => throw _privateConstructorUsedError;
  String? get teamMemberPreferredLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSurveyStateCopyWith<UserSurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSurveyStateCopyWith<$Res> {
  factory $UserSurveyStateCopyWith(
          UserSurveyState value, $Res Function(UserSurveyState) then) =
      _$UserSurveyStateCopyWithImpl<$Res, UserSurveyState>;
  @useResult
  $Res call(
      {List<String> selectedSkills,
      List<String> selectedHackathonThemes,
      String? selectedHackathonType,
      String? teamMemberPreferredLocation});
}

/// @nodoc
class _$UserSurveyStateCopyWithImpl<$Res, $Val extends UserSurveyState>
    implements $UserSurveyStateCopyWith<$Res> {
  _$UserSurveyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSkills = null,
    Object? selectedHackathonThemes = null,
    Object? selectedHackathonType = freezed,
    Object? teamMemberPreferredLocation = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSkills: null == selectedSkills
          ? _value.selectedSkills
          : selectedSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedHackathonThemes: null == selectedHackathonThemes
          ? _value.selectedHackathonThemes
          : selectedHackathonThemes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedHackathonType: freezed == selectedHackathonType
          ? _value.selectedHackathonType
          : selectedHackathonType // ignore: cast_nullable_to_non_nullable
              as String?,
      teamMemberPreferredLocation: freezed == teamMemberPreferredLocation
          ? _value.teamMemberPreferredLocation
          : teamMemberPreferredLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSurveyStateCopyWith<$Res>
    implements $UserSurveyStateCopyWith<$Res> {
  factory _$$_UserSurveyStateCopyWith(
          _$_UserSurveyState value, $Res Function(_$_UserSurveyState) then) =
      __$$_UserSurveyStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> selectedSkills,
      List<String> selectedHackathonThemes,
      String? selectedHackathonType,
      String? teamMemberPreferredLocation});
}

/// @nodoc
class __$$_UserSurveyStateCopyWithImpl<$Res>
    extends _$UserSurveyStateCopyWithImpl<$Res, _$_UserSurveyState>
    implements _$$_UserSurveyStateCopyWith<$Res> {
  __$$_UserSurveyStateCopyWithImpl(
      _$_UserSurveyState _value, $Res Function(_$_UserSurveyState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSkills = null,
    Object? selectedHackathonThemes = null,
    Object? selectedHackathonType = freezed,
    Object? teamMemberPreferredLocation = freezed,
  }) {
    return _then(_$_UserSurveyState(
      selectedSkills: null == selectedSkills
          ? _value._selectedSkills
          : selectedSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedHackathonThemes: null == selectedHackathonThemes
          ? _value._selectedHackathonThemes
          : selectedHackathonThemes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedHackathonType: freezed == selectedHackathonType
          ? _value.selectedHackathonType
          : selectedHackathonType // ignore: cast_nullable_to_non_nullable
              as String?,
      teamMemberPreferredLocation: freezed == teamMemberPreferredLocation
          ? _value.teamMemberPreferredLocation
          : teamMemberPreferredLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSurveyState implements _UserSurveyState {
  const _$_UserSurveyState(
      {final List<String> selectedSkills = const [],
      final List<String> selectedHackathonThemes = const [],
      this.selectedHackathonType,
      this.teamMemberPreferredLocation})
      : _selectedSkills = selectedSkills,
        _selectedHackathonThemes = selectedHackathonThemes;

  factory _$_UserSurveyState.fromJson(Map<String, dynamic> json) =>
      _$$_UserSurveyStateFromJson(json);

  final List<String> _selectedSkills;
  @override
  @JsonKey()
  List<String> get selectedSkills {
    if (_selectedSkills is EqualUnmodifiableListView) return _selectedSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSkills);
  }

  final List<String> _selectedHackathonThemes;
  @override
  @JsonKey()
  List<String> get selectedHackathonThemes {
    if (_selectedHackathonThemes is EqualUnmodifiableListView)
      return _selectedHackathonThemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedHackathonThemes);
  }

  @override
  final String? selectedHackathonType;
  @override
  final String? teamMemberPreferredLocation;

  @override
  String toString() {
    return 'UserSurveyState(selectedSkills: $selectedSkills, selectedHackathonThemes: $selectedHackathonThemes, selectedHackathonType: $selectedHackathonType, teamMemberPreferredLocation: $teamMemberPreferredLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSurveyState &&
            const DeepCollectionEquality()
                .equals(other._selectedSkills, _selectedSkills) &&
            const DeepCollectionEquality().equals(
                other._selectedHackathonThemes, _selectedHackathonThemes) &&
            (identical(other.selectedHackathonType, selectedHackathonType) ||
                other.selectedHackathonType == selectedHackathonType) &&
            (identical(other.teamMemberPreferredLocation,
                    teamMemberPreferredLocation) ||
                other.teamMemberPreferredLocation ==
                    teamMemberPreferredLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedSkills),
      const DeepCollectionEquality().hash(_selectedHackathonThemes),
      selectedHackathonType,
      teamMemberPreferredLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSurveyStateCopyWith<_$_UserSurveyState> get copyWith =>
      __$$_UserSurveyStateCopyWithImpl<_$_UserSurveyState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSurveyStateToJson(
      this,
    );
  }
}

abstract class _UserSurveyState implements UserSurveyState {
  const factory _UserSurveyState(
      {final List<String> selectedSkills,
      final List<String> selectedHackathonThemes,
      final String? selectedHackathonType,
      final String? teamMemberPreferredLocation}) = _$_UserSurveyState;

  factory _UserSurveyState.fromJson(Map<String, dynamic> json) =
      _$_UserSurveyState.fromJson;

  @override
  List<String> get selectedSkills;
  @override
  List<String> get selectedHackathonThemes;
  @override
  String? get selectedHackathonType;
  @override
  String? get teamMemberPreferredLocation;
  @override
  @JsonKey(ignore: true)
  _$$_UserSurveyStateCopyWith<_$_UserSurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}
