import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'send_notification_model.freezed.dart';
part 'send_notification_model.g.dart';

@freezed
class SendNotificationModel with _$SendNotificationModel {
  const factory SendNotificationModel({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'tokens') required List<String> tokens,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
  }) = _SendNotificationModel;
  factory SendNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$SendNotificationModelFromJson(json);
}
