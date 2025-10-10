// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomePageStateImpl _$$HomePageStateImplFromJson(Map<String, dynamic> json) =>
    _$HomePageStateImpl(
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupsStatus: json['groupsStatus'] == null
          ? const ApiLoading()
          : ApiState<List<GroupModel>>.fromJson(
              json['groupsStatus'] as Map<String, dynamic>,
              (value) => (value as List<dynamic>)
                  .map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
      usersStatus: json['usersStatus'] == null
          ? const ApiLoaded([])
          : ApiState<List<UserModel>>.fromJson(
              json['usersStatus'] as Map<String, dynamic>,
              (value) => (value as List<dynamic>)
                  .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
    );

Map<String, dynamic> _$$HomePageStateImplToJson(_$HomePageStateImpl instance) =>
    <String, dynamic>{
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
      'groupsStatus': instance.groupsStatus.toJson(
        (value) => value.map((e) => e.toJson()).toList(),
      ),
      'usersStatus': instance.usersStatus.toJson(
        (value) => value.map((e) => e.toJson()).toList(),
      ),
    };
