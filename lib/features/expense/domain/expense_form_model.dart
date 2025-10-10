import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:teatally/features/home/domain/users_model.dart';

part 'expense_form_model.freezed.dart';
part 'expense_form_model.g.dart';

@Freezed()
class ExpenseFormModel with _$ExpenseFormModel {
  const factory ExpenseFormModel({
    @JsonKey(ignore: true) @Default([]) List<UserModel> members,
    @JsonKey(name: 'total') @Default(0.0) double total,
    @JsonKey(name: 'remainingAmount') @Default(0.0) double remainingAmount,
    @JsonKey(name: 'paidByUserId') String? paidByUserId,
    @JsonKey(name: 'paidByUserName') String? paidByUserName,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'userExpense')
    @Default([])
    List<ExpenseUserData> userExpense,
  }) = _ExpenseFormModel;

  factory ExpenseFormModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFormModelFromJson(json);
}

@Freezed()
class ExpenseUserData with _$ExpenseUserData {
  const factory ExpenseUserData({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'userName') required String userName,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'items') required List<ExpenseItemModel> items,
  }) = _ExpenseUserData;

  factory ExpenseUserData.fromJson(Map<String, dynamic> json) =>
      _$ExpenseUserDataFromJson(json);
}

@Freezed()
class ExpenseItemModel with _$ExpenseItemModel {
  const factory ExpenseItemModel({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'count') required int count,
  }) = _ExpenseItemModel;

  factory ExpenseItemModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemModelFromJson(json);
}
