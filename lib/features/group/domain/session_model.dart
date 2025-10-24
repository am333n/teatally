import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
class SessionModel with _$SessionModel {
  const factory SessionModel({
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'isCreatedByCurrentUser') bool? isCreatedByCurrentUser,
    @JsonKey(name: 'docId', includeToJson: false) String? docId,
    @JsonKey(name: 'groupId') String? groupId,
    @JsonKey(name: 'startedBy') String? startedBy,
    @JsonKey(name: 'startedByName') String? startedByName,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedBy') String? updatedBy,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
    @JsonKey(name: 'stoppedAt') DateTime? stoppedAt,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'selectedItems') List<SelectedItem>? selectedItems,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

@freezed
class SelectedItem with _$SelectedItem {
  const factory SelectedItem({
    @JsonKey(name: 'itemUid') String? itemUid,
    @JsonKey(name: 'itemName') String? itemName,
    @JsonKey(name: 'categoryId') String? categoryId,
    @JsonKey(name: 'totalCount') int? totalCount,
    @JsonKey(name: 'itemPrice') double? itemPrice,
    @JsonKey(name: 'selections') List<Selection>? selections,
  }) = _SelectedItem;

  factory SelectedItem.fromJson(Map<String, dynamic> json) =>
      _$SelectedItemFromJson(json);
}

@freezed
class Selection with _$Selection {
  const factory Selection({
    @JsonKey(name: 'userUid') String? userUid,
    @JsonKey(name: 'count') int? count,
  }) = _Selection;

  factory Selection.fromJson(Map<String, dynamic> json) =>
      _$SelectionFromJson(json);
}
