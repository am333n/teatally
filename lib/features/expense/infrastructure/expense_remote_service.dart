import 'package:injectable/injectable.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';

@injectable
class ExpenseRemoteService with BaseFirebase {
  BaseReturnType getGroupMemberDetails(List<String> ids) {
    final currentUsedID = super.firebaseAuth.currentUser?.uid;
    if (currentUsedID != null) {
      ids.add(currentUsedID);
    }
    return super.getAllItemsWhere(Collections.users,
        whereInConditions: [MapEntry('uid', ids)]);
  }
}
