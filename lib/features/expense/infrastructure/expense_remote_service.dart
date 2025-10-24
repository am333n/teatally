import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/features/expense/domain/expense_form_model.dart';

@injectable
class ExpenseRemoteService with BaseFirebase {
  BaseReturnType getGroupMemberDetails(List<String> ids) {
    final currentUsedID = super.userData?.uid;
    if (currentUsedID != null) {
      ids.add(currentUsedID);
    }
    return super.getAllItemsWhere(Collections.users,
        whereInConditions: [MapEntry('uid', ids)]);
  }

  BaseReturnType createExpense(ExpenseFormModel expense) {
    final currentUsed = super.userData;
    expense = expense.copyWith(
        updatedById: currentUsed?.uid,
        updatedByUserName: currentUsed?.displayName);
    return super
        .addItem(Collections.expense, expense.toJson(), uniqueField: 'uid');
  }

  BaseReturnType getAllExpenseOrdered(String groupUid,
      {bool descending = true}) {
    return super.getAllItemsWhere(
      Collections.expense,
      whereConditions: {'groupId': groupUid},
      orderByField: 'date',
      descending: descending,
    );
  }

  BaseReturnType getExpenseDetails(String docID, {bool descending = true}) {
    return super.getItem(Collections.expense, docID);
  }

  BaseReturnType updateExpenseDetails(String docID, ExpenseFormModel data) {
    return super.updateItem(Collections.expense, docID, data.toJson());
  }

  BaseReturnType deleteExpense(String docID) {
    return super.deleteItem(Collections.expense, docID);
  }

  BaseReturnType settleAllPendingExpense(List<String> docIDs) {
    final user = super.userData;
    final now = DateTime.now();
    return super.updateMultipleDocuments(
        docIds: docIDs,
        collectionPath: Collections.expense,
        updateData: {
          'isPaid': true,
          'paidByUserName': user?.displayName,
          'paidByUserId': user?.uid,
          'updatedAt': now.toIso8601String(),
          'updatedById': user?.uid,
        });
  }
}
