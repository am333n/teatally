// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupDetailStateImpl _$$GroupDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupDetailStateImpl(
      membersState: json['membersState'] == null
          ? const ApiState.loading()
          : ApiState<List<UserModel>>.fromJson(
              json['membersState'] as Map<String, dynamic>,
              (value) => (value as List<dynamic>)
                  .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
      categoriesState: json['categoriesState'] == null
          ? const ApiState.loading()
          : ApiState<List<CategoriesModel>>.fromJson(
              json['categoriesState'] as Map<String, dynamic>,
              (value) => (value as List<dynamic>)
                  .map((e) =>
                      CategoriesModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
      itemsState: json['itemsState'] == null
          ? const ApiState.loading()
          : ApiState<List<ItemModel>>.fromJson(
              json['itemsState'] as Map<String, dynamic>,
              (value) => (value as List<dynamic>)
                  .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
      allItems: (json['allItems'] as List<dynamic>?)
              ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sessionState: json['sessionState'] == null
          ? const ApiState.loading()
          : ApiState<SessionModel?>.fromJson(
              json['sessionState'] as Map<String, dynamic>,
              (value) => value == null
                  ? null
                  : SessionModel.fromJson(value as Map<String, dynamic>)),
      selectedCategory: json['selectedCategory'] as String?,
    );

Map<String, dynamic> _$$GroupDetailStateImplToJson(
        _$GroupDetailStateImpl instance) =>
    <String, dynamic>{
      'membersState': instance.membersState.toJson(
        (value) => value.map((e) => e.toJson()).toList(),
      ),
      'categoriesState': instance.categoriesState.toJson(
        (value) => value.map((e) => e.toJson()).toList(),
      ),
      'itemsState': instance.itemsState.toJson(
        (value) => value.map((e) => e.toJson()).toList(),
      ),
      'allItems': instance.allItems.map((e) => e.toJson()).toList(),
      'sessionState': instance.sessionState.toJson(
        (value) => value?.toJson(),
      ),
      'selectedCategory': instance.selectedCategory,
    };
