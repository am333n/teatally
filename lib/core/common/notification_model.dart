import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'docId', includeToJson: false) String? docId,
    @JsonKey(name: 'userUID') required String userId,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'userName') required String userName,
    @JsonKey(name: 'fcmToken') required String fcmToken,
    @JsonKey(name: 'deviceName') String? deviceName,
    @JsonKey(name: 'deviceID') String? deviceID,
    @JsonKey(name: 'deviceDisplayName') String? deviceDisplayName,
    @JsonKey(name: 'lastUpdatedAt') DateTime? lastUpdatedAt,
    @JsonKey(name: 'isActive') bool? isActive,
  }) = _NotificationModel;
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
