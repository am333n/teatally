// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_details_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupDetailsLoadedStateModelImpl _$$GroupDetailsLoadedStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupDetailsLoadedStateModelImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedCategory: json['selectedCategory'] as String?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      session: json['session'] == null
          ? null
          : SessionModel.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupDetailsLoadedStateModelImplToJson(
        _$GroupDetailsLoadedStateModelImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'selectedCategory': instance.selectedCategory,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'session': instance.session?.toJson(),
    };
