import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/base_repository.dart';
import 'package:teatally/features/expense/domain/expense_form_model.dart';
import 'package:teatally/features/expense/infrastructure/expense_remote_service.dart';
import 'package:teatally/features/home/domain/users_model.dart';

@injectable
class ExpenseRepository with BaseRepo {
  final ExpenseRemoteService _remoteService;

  ExpenseRepository(this._remoteService);

  RepoResponse<List<UserModel>> getGroupMemberDetails(List<String> ids) {
    return super.getListData(
        () => _remoteService.getGroupMemberDetails(ids), UserModel.fromJson);
  }

  RepoResponse<bool> createExpense(ExpenseFormModel expense) {
    return super.performAction(() => _remoteService.createExpense(expense));
  }

  RepoResponse<bool> updateExpenseDetails(String docID, ExpenseFormModel data) {
    return super
        .performAction(() => _remoteService.updateExpenseDetails(docID, data));
  }

  RepoResponse<bool> deleteExpense(String docID) {
    return super.performAction(() => _remoteService.deleteExpense(
          docID,
        ));
  }

  RepoResponse<bool> settleAllPendingExpense(List<String> docIDs) {
    return super.performAction(() => _remoteService.settleAllPendingExpense(
          docIDs,
        ));
  }

  RepoResponse<List<ExpenseFormModel>> getAllExpense(String groupUid) {
    return super.getListData(
        () => _remoteService.getAllExpenseOrdered(groupUid),
        ExpenseFormModel.fromJson);
  }

  RepoResponse<ExpenseFormModel> getExpenseDetails(String docId) {
    return super.getData(() => _remoteService.getExpenseDetails(docId),
        ExpenseFormModel.fromJson);
  }
}
