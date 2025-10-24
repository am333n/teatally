// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      docId: json['docId'] as String?,
      userId: json['userUID'] as String,
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      fcmToken: json['fcmToken'] as String,
      deviceName: json['deviceName'] as String?,
      deviceID: json['deviceID'] as String?,
      deviceDisplayName: json['deviceDisplayName'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] == null
          ? null
          : DateTime.parse(json['lastUpdatedAt'] as String),
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'userUID': instance.userId,
      'uid': instance.uid,
      'userName': instance.userName,
      'fcmToken': instance.fcmToken,
      'deviceName': instance.deviceName,
      'deviceID': instance.deviceID,
      'deviceDisplayName': instance.deviceDisplayName,
      'lastUpdatedAt': instance.lastUpdatedAt?.toIso8601String(),
      'isActive': instance.isActive,
    };
