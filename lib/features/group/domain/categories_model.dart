// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'categories_model.freezed.dart';
part 'categories_model.g.dart';

@freezed
class CategoriesModel with _$CategoriesModel {
  const factory CategoriesModel({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'docId') String? docId,
    @JsonKey(name: 'groupId') String? groupId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'createdBy') String? createdBy,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'priority') int? priority,
  }) = _CategoriesModel;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
