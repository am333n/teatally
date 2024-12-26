import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'docId') String? docId,
    @JsonKey(name: 'groupId') String? groupId,
    @JsonKey(name: 'categoryId') String? categoryId,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'tags') List<String>? tags,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'createdBy') String? createdBy,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _ItemModel;
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
