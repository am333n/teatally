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
  BaseReturnType getAllUsersList() async {
    try {
      final currentUser = firebaseAuth.currentUser?.uid;
      if (currentUser == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'User Not Authenticated'));
      }
      final snapshot = await super
          .firebaseFirestore
          .collection(Collections.users)
          .where('', arrayContains: currentUser)
          .orderBy('isPinned', descending: true)
          .get();

      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();

      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
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
          .orderBy('isPinned', descending: true)
          .get();

      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();

      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  BaseReturnType setIsPinned(String? docid, bool currentPinnedStatus) async {
    if (docid == null) {
      return const RemoteResponse.failure(
          Failure.serverError(message: 'Invalid docId'));
    }
    return await super.updateItem(Collections.groups, docid, {
      'isPinned': !currentPinnedStatus,
    });
  }

  BaseReturnType deleteGroup(String? docId) {
    return super.deleteItem(Collections.groups, docId);
  }
}
