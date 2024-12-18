import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/home/domain/group_model.dart';

@injectable
class HomeRemoteService with BaseFirebase {
  BaseReturnType getAllUsersList() {
    return super.getAllItemsExceptCurrentUser(Collections.users);
  }

  BaseReturnType createGroup(GroupModel groupDetails) {
    return super.addItem(Collections.groups, groupDetails.toJson());
  }

  BaseReturnType getAllGroups() async {
    try {
      final currentUser = await CredentialStorage.getUid();
      final snapshot = await super
          .firebaseFirestore
          .collection(Collections.groups)
          .where('members', arrayContains: currentUser)
          .get();
      List<Map<String, dynamic>> items =
          snapshot.docs.map((doc) => doc.data()).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }
}
