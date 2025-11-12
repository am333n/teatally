// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendNotificationModelImpl _$$SendNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendNotificationModelImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      tokens:
          (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
      data: json['data'] == null
          ? null
          : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SendNotificationModelImplToJson(
        _$SendNotificationModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'tokens': instance.tokens,
      'data': instance.data?.toJson(),
    };

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
