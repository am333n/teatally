// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionModelImpl _$$SessionModelImplFromJson(Map<String, dynamic> json) =>
    _$SessionModelImpl(
      uid: json['uid'] as String?,
      docId: json['docId'] as String?,
      groupId: json['groupId'] as String?,
      startedBy: json['startedBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      stoppedAt: json['stoppedAt'] == null
          ? null
          : DateTime.parse(json['stoppedAt'] as String),
      isActive: json['isActive'] as bool?,
      selectedItems: (json['selectedItems'] as List<dynamic>?)
          ?.map((e) => SelectedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionModelImplToJson(_$SessionModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'docId': instance.docId,
      'groupId': instance.groupId,
      'startedBy': instance.startedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'stoppedAt': instance.stoppedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'selectedItems': instance.selectedItems?.map((e) => e.toJson()).toList(),
    };

_$SelectedItemImpl _$$SelectedItemImplFromJson(Map<String, dynamic> json) =>
    _$SelectedItemImpl(
      itemUid: json['itemUid'] as String?,
      itemName: json['itemName'] as String?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      selections: (json['selections'] as List<dynamic>?)
          ?.map((e) => Selection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SelectedItemImplToJson(_$SelectedItemImpl instance) =>
    <String, dynamic>{
      'itemUid': instance.itemUid,
      'itemName': instance.itemName,
      'totalCount': instance.totalCount,
      'selections': instance.selections?.map((e) => e.toJson()).toList(),
    };

_$SelectionImpl _$$SelectionImplFromJson(Map<String, dynamic> json) =>
    _$SelectionImpl(
      userUid: json['userUid'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SelectionImplToJson(_$SelectionImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'count': instance.count,
    };
