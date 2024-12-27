// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_loaded_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomePageLoadedStateModelImpl _$$HomePageLoadedStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomePageLoadedStateModelImpl(
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isButtonLoading: json['isButtonLoading'] as bool?,
    );

Map<String, dynamic> _$$HomePageLoadedStateModelImplToJson(
        _$HomePageLoadedStateModelImpl instance) =>
    <String, dynamic>{
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
      'isButtonLoading': instance.isButtonLoading,
    };
