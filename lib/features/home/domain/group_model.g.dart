// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      uid: json['uid'] as String,
      docId: json['docId'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      admin: json['admin'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      isPinned: json['isPinned'] as bool,
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'docId': instance.docId,
      'name': instance.name,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'members': instance.members,
      'admin': instance.admin,
      'icon': instance.icon,
      'color': instance.color,
      'isPinned': instance.isPinned,
    };
