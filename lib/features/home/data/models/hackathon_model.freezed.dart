// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hackathon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HackathonModel _$HackathonModelFromJson(Map<String, dynamic> json) {
  return _HackathonModel.fromJson(json);
}

/// @nodoc
mixin _$HackathonModel {
  @JsonKey(name: '\$id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  String? get onClick => throw _privateConstructorUsedError;
  String get banner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HackathonModelCopyWith<HackathonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HackathonModelCopyWith<$Res> {
  factory $HackathonModelCopyWith(
          HackathonModel value, $Res Function(HackathonModel) then) =
      _$HackathonModelCopyWithImpl<$Res, HackathonModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String id,
      String name,
      String mode,
      String theme,
      @JsonKey(name: 'start_date') DateTime startDate,
      String? onClick,
      String banner});
}

/// @nodoc
class _$HackathonModelCopyWithImpl<$Res, $Val extends HackathonModel>
    implements $HackathonModelCopyWith<$Res> {
  _$HackathonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mode = null,
    Object? theme = null,
    Object? startDate = null,
    Object? onClick = freezed,
    Object? banner = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      onClick: freezed == onClick
          ? _value.onClick
          : onClick // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HackathonModelCopyWith<$Res>
    implements $HackathonModelCopyWith<$Res> {
  factory _$$_HackathonModelCopyWith(
          _$_HackathonModel value, $Res Function(_$_HackathonModel) then) =
      __$$_HackathonModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String id,
      String name,
      String mode,
      String theme,
      @JsonKey(name: 'start_date') DateTime startDate,
      String? onClick,
      String banner});
}

/// @nodoc
class __$$_HackathonModelCopyWithImpl<$Res>
    extends _$HackathonModelCopyWithImpl<$Res, _$_HackathonModel>
    implements _$$_HackathonModelCopyWith<$Res> {
  __$$_HackathonModelCopyWithImpl(
      _$_HackathonModel _value, $Res Function(_$_HackathonModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mode = null,
    Object? theme = null,
    Object? startDate = null,
    Object? onClick = freezed,
    Object? banner = null,
  }) {
    return _then(_$_HackathonModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      onClick: freezed == onClick
          ? _value.onClick
          : onClick // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HackathonModel implements _HackathonModel {
  const _$_HackathonModel(
      {@JsonKey(name: '\$id') required this.id,
      required this.name,
      required this.mode,
      required this.theme,
      @JsonKey(name: 'start_date') required this.startDate,
      this.onClick,
      required this.banner});

  factory _$_HackathonModel.fromJson(Map<String, dynamic> json) =>
      _$$_HackathonModelFromJson(json);

  @override
  @JsonKey(name: '\$id')
  final String id;
  @override
  final String name;
  @override
  final String mode;
  @override
  final String theme;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  final String? onClick;
  @override
  final String banner;

  @override
  String toString() {
    return 'HackathonModel(id: $id, name: $name, mode: $mode, theme: $theme, startDate: $startDate, onClick: $onClick, banner: $banner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HackathonModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.onClick, onClick) || other.onClick == onClick) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, mode, theme, startDate, onClick, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HackathonModelCopyWith<_$_HackathonModel> get copyWith =>
      __$$_HackathonModelCopyWithImpl<_$_HackathonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HackathonModelToJson(
      this,
    );
  }
}

abstract class _HackathonModel implements HackathonModel {
  const factory _HackathonModel(
      {@JsonKey(name: '\$id') required final String id,
      required final String name,
      required final String mode,
      required final String theme,
      @JsonKey(name: 'start_date') required final DateTime startDate,
      final String? onClick,
      required final String banner}) = _$_HackathonModel;

  factory _HackathonModel.fromJson(Map<String, dynamic> json) =
      _$_HackathonModel.fromJson;

  @override
  @JsonKey(name: '\$id')
  String get id;
  @override
  String get name;
  @override
  String get mode;
  @override
  String get theme;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  String? get onClick;
  @override
  String get banner;
  @override
  @JsonKey(ignore: true)
  _$$_HackathonModelCopyWith<_$_HackathonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
