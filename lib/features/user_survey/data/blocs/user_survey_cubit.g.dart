// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_survey_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyState _$$_UserSurveyStateFromJson(Map<String, dynamic> json) =>
    _$_UserSurveyState(
      selectedSkills: (json['selectedSkills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedHackathonThemes:
          (json['selectedHackathonThemes'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      selectedHackathonType: json['selectedHackathonType'] as String?,
      teamMemberPreferredLocation:
          json['teamMemberPreferredLocation'] as String?,
    );

Map<String, dynamic> _$$_UserSurveyStateToJson(_$_UserSurveyState instance) =>
    <String, dynamic>{
      'selectedSkills': instance.selectedSkills,
      'selectedHackathonThemes': instance.selectedHackathonThemes,
      'selectedHackathonType': instance.selectedHackathonType,
      'teamMemberPreferredLocation': instance.teamMemberPreferredLocation,
    };
