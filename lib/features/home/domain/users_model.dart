import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'docId', includeToJson: false) String? docId,
    @JsonKey(name: 'photoURL') String? photoURL,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
