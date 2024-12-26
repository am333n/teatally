import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel with _$GroupModel {
  const factory GroupModel({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'docId') String? docId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'createdBy') required String createdBy,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @JsonKey(name: 'members') required List<String> members,
    @JsonKey(name: 'admin') required String admin,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
    @JsonKey(name: 'isPinned') required bool isPinned,
  }) = _GroupModel;
  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
