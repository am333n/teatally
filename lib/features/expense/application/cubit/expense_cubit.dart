import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/api_state.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/features/expense/domain/expense_form_model.dart';
import 'package:teatally/features/expense/infrastructure/expense_repository.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';

part 'expense_state.dart';
part 'expense_cubit.freezed.dart';
part 'expense_cubit.g.dart';

@injectable
class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this._repository) : super(ExpenseState());
  final ExpenseRepository _repository;
  Future<void> setUpExpenseDataFromSession(
      SessionModel? session, List<UserModel> members) async {
    emit(state.copyWith(formData: ApiLoading()));
    final membersID = members.map((e) => e.uid).toList();
    List<UserModel> allMembers = [];
    final response = await _repository.getGroupMemberDetails(membersID);
    response.fold((f) {}, (r) {
      log(r.toString());
      allMembers = r;
    });
    try {
      final totalAmount = session?.selectedItems
              ?.map((e) => ((e.itemPrice ?? 0) * (e.totalCount ?? 1)))
              .fold<double>(0, (sum, price) => sum + (price ?? 0)) ??
          0.0;
      final memeberExpenseModel = buildExpenseUserData(
          users: allMembers, selectedItems: session?.selectedItems ?? []);
      final remainingAmount = memeberExpenseModel
          .map((e) => e.amount)
          .fold<double>(0, (sum, price) => sum + (price ?? 0));
      ExpenseFormModel formData = ExpenseFormModel(
          total: totalAmount,
          members: allMembers,
          remainingAmount: remainingAmount,
          userExpense: memeberExpenseModel);
      emit(state.copyWith(formData: ApiLoaded(formData)));
    } on Exception catch (e) {
      emit(state.copyWith(
          formData: ApiError(FailureHandler.dataConversionFailure)));
    }
  }

  List<ExpenseUserData> buildExpenseUserData({
    required List<UserModel> users,
    required List<SelectedItem> selectedItems,
  }) {
    List<ExpenseUserData> result = [];

    for (final user in users) {
      // Filter items selected by this user
      final userItems = selectedItems.where((item) {
        return item.selections?.any((s) => s.userUid == user.uid) ?? false;
      }).toList();

      // Map selected items to new items with only the count relevant to the user
      final itemsForUser = userItems.map((item) {
        final selectionForUser =
            item.selections?.firstWhere((s) => s.userUid == user.uid) ??
                Selection(userUid: user.uid, count: 0);

        // Multiply price by count for total calculation if needed per item
        return ExpenseItemModel(
          uid: item.itemUid ?? '',
          name: item.itemName ?? '',
          price: item.itemPrice ?? 0,
          count: selectionForUser.count ?? 0,
        );
      }).toList();

      // Calculate total amount for this user
      final totalAmount = itemsForUser.fold<double>(
          0, (sum, item) => sum + ((item.price ?? 0) * (item.count ?? 0)));

      // Add ExpenseUserData to the result
      result.add(ExpenseUserData(
        uid: user.uid,
        userName: user.displayName ?? '',
        amount: totalAmount,
        items: itemsForUser,
      ));
    }

    return result;
  }
}
