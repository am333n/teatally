import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';

part 'group_details_state_model.freezed.dart';
part 'group_details_state_model.g.dart';

@freezed
class GroupDetailsLoadedStateModel with _$GroupDetailsLoadedStateModel {
  const factory GroupDetailsLoadedStateModel(
      {List<CategoriesModel>? categories,
      List<ItemModel>? items,
      String? selectedCategory,
      List<UserModel>? members,
      SessionModel? session}) = _GroupDetailsLoadedStateModel;
  factory GroupDetailsLoadedStateModel.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailsLoadedStateModelFromJson(json);
}
