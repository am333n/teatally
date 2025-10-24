import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:teatally/features/home/domain/users_model.dart';
import 'package:uuid/uuid.dart';

part 'expense_form_model.freezed.dart';
part 'expense_form_model.g.dart';

@Freezed()
class ExpenseFormModel with _$ExpenseFormModel {
  const factory ExpenseFormModel({
    @JsonKey(ignore: true) @Default([]) List<UserModel> members,
    @JsonKey(ignore: true) @Default(false) bool isLoading,
    @JsonKey(name: 'total') @Default(0.0) double total,
    @JsonKey(name: 'paidByUserId') String? paidByUserId,
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'docId', includeToJson: false) String? docId,
    @JsonKey(name: 'groupId') String? groupId,
    @JsonKey(name: 'sessionId') String? sessionId,
    @JsonKey(name: 'paidByUserName') String? paidByUserName,
    @JsonKey(name: 'isPaid') @Default(false) bool? isPaid,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
    @JsonKey(name: 'date') DateTime? date,
    @JsonKey(name: 'updatedById') String? updatedById,
    @JsonKey(name: 'updatedByUserName') String? updatedByUserName,
    @JsonKey(name: 'userExpense')
    @Default([])
    List<ExpenseUserData> userExpense,
  }) = _ExpenseFormModel;
  const ExpenseFormModel._();

  ExpenseFormModel fromForm(Map<String, dynamic> formData) {
    final updatedUserExpense = userExpense.map((user) {
      final newValue =
          double.tryParse(formData[user.uid]?.toString() ?? '0') ?? 0;
      final hasChanged = newValue != user.amount;

      return user.copyWith(
        amount: newValue,
        items: hasChanged ? [] : user.items,
      );
    }).toList();

    final newTotal =
        updatedUserExpense.fold<double>(0, (sum, e) => sum + e.amount);

    final updatedData = copyWith(
      total: newTotal,
      updatedAt: DateTime.now(),
      uid: const Uuid().v4(),
      date: formData['date'],
      isPaid: formData['status'],
      userExpense: updatedUserExpense,
    );
    log(updatedData.toString());
    return updatedData;
  }

  factory ExpenseFormModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFormModelFromJson(json);
}

@Freezed()
class ExpenseUserData with _$ExpenseUserData {
  const factory ExpenseUserData({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'userName') required String userName,
    @JsonKey(name: 'photoURL') String? photoURL,
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
