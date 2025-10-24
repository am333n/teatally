import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/api_state.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/widgets/toast.dart';
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
    emit(state.copyWith(formData: const ApiLoading()));
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
      ExpenseFormModel formData = ExpenseFormModel(
          total: totalAmount,
          members: allMembers,
          groupId: session?.groupId,
          sessionId: session?.uid,
          userExpense: memeberExpenseModel);
      emit(state.copyWith(formData: ApiLoaded(formData)));
    } on Exception catch (e) {
      emit(state.copyWith(
          formData: const ApiError(FailureHandler.dataConversionFailure)));
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
        photoURL: user.photoURL,
        amount: totalAmount,
        items: itemsForUser,
      ));
    }

    return result;
  }

  Future<bool> createExpense(ExpenseFormModel data) async {
    var formData = data.copyWith(isLoading: true);
    emit(state.copyWith(formData: ApiLoaded(formData)));
    final response = await _repository.createExpense(formData);
    return response.fold((f) {
      Toast.showErrorMessage(f.toString());
      formData = data.copyWith(isLoading: false);
      emit(state.copyWith(formData: ApiLoaded(formData)));
      return false;
    }, (r) {
      Toast.showSuccess('Expense saved');
      getIt<AppRouter>().maybePop();
      formData = data.copyWith(isLoading: false);
      emit(state.copyWith(formData: ApiLoaded(formData)));
      return true;
    });
  }

  Future<void> settleAllPendingExpense(
      String? groupId, List<String> docIDs) async {
    emit(state.copyWith(expenseListStatus: ApiLoading()));
    final response = await _repository.settleAllPendingExpense(docIDs);
    response.fold((f) {
      Toast.showErrorMessage(f.toString());
    }, (r) {
      Toast.showSuccess('All Pending Settled');
    });
    getAllExpense(groupId);
  }

  Future<void> getEditData(String? docID) async {
    if (docID == null) {
      emit(state.copyWith(
          formData:
              const ApiError(Failure.clientError(message: 'Invalid Id'))));
      return;
    }
    emit(state.copyWith(formData: const ApiLoading()));

    final response = await _repository.getExpenseDetails(docID);
    response.fold((f) {
      emit(state.copyWith(formData: ApiError(f)));
    }, (r) async {
      final response = await _repository
          .getGroupMemberDetails(r.userExpense.map((e) => e.uid).toList());
      response.fold((f) {}, (members) {
        r = r.copyWith(members: members);
      });
      emit(state.copyWith(formData: ApiLoaded(r)));
    });
  }

  Future<void> updateExpenseDetails(
      String? docID, ExpenseFormModel data) async {
    if (docID == null) {
      emit(state.copyWith(
          formData:
              const ApiError(Failure.clientError(message: 'Invalid Id'))));
      return;
    }
    var formData = data.copyWith(isLoading: true);
    emit(state.copyWith(formData: ApiLoaded(formData)));
    final response = await _repository.updateExpenseDetails(docID, formData);
    response.fold((f) {
      Toast.showErrorMessage(f.toString());
      formData = data.copyWith(isLoading: false);
      emit(state.copyWith(formData: ApiLoaded(formData)));
    }, (r) {
      Toast.showSuccess('Expense Updated');
      getIt<AppRouter>().maybePop();
      getExpenseDetails(docID);
      getAllExpense(formData.groupId);
      formData = data.copyWith(isLoading: false);
      emit(state.copyWith(formData: ApiLoaded(formData)));
    });
  }

  Future<void> deleteExpense(String? docID, String? groupId) async {
    if (docID == null) {
      Toast.showErrorMessage('InvalidID');
      return;
    }
    final data = state.expenseDetailsStatus.getOrNull();
    emit(state.copyWith(expenseDetailsStatus: const ApiLoading()));
    final response = await _repository.deleteExpense(docID);
    response.fold((f) {
      Toast.showErrorMessage(f.toString());
    }, (r) {
      getIt<AppRouter>().maybePop();
      getAllExpense(groupId);
    });
    emit(state.copyWith(
        expenseDetailsStatus: ApiLoaded(data ?? const ExpenseFormModel())));
  }

  Future<void> getAllExpense(String? groupUid) async {
    if (groupUid == null) {
      emit(state.copyWith(
          expenseListStatus:
              const ApiError(Failure.clientError(message: 'Invalid Id'))));
      return;
    }
    emit(state.copyWith(expenseListStatus: const ApiLoading()));
    final response = await _repository.getAllExpense(groupUid);
    response.fold((f) {
      emit(state.copyWith(expenseListStatus: ApiError(f)));
    }, (r) {
      emit(state.copyWith(expenseListStatus: ApiLoaded(r)));
    });
  }

  Future<void> getExpenseDetails(String? docID) async {
    if (docID == null) {
      emit(state.copyWith(
          expenseDetailsStatus:
              const ApiError(Failure.clientError(message: 'Invalid Id'))));
      return;
    }
    emit(state.copyWith(expenseDetailsStatus: const ApiLoading()));
    final response = await _repository.getExpenseDetails(docID);
    response.fold((f) {
      emit(state.copyWith(expenseDetailsStatus: ApiError(f)));
    }, (r) {
      emit(state.copyWith(expenseDetailsStatus: ApiLoaded(r)));
    });
  }
}
