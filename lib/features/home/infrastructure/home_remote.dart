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
          .where('uid', isNotEqualTo: currentUser)
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

  BaseReturnType deleteGroup(String? docId) async {
    try {
      final currentUser = await CredentialStorage.getUid();
      final snapshot = await super
          .firebaseFirestore
          .collection(Collections.groups)
          .doc(docId)
          .get();

      final data = snapshot.data();
      final groupId = data?['uid'];

      // Delete the group document
      await super
          .firebaseFirestore
          .collection(Collections.groups)
          .doc(docId)
          .delete();

      // Delete related documents from categories, items, and sessions
      final batch = super.firebaseFirestore.batch();

      // Delete from categories
      final categoriesSnapshot = await super
          .firebaseFirestore
          .collection(Collections.categories)
          .where('groupId', isEqualTo: groupId)
          .get();
      for (final doc in categoriesSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Delete from items
      final itemsSnapshot = await super
          .firebaseFirestore
          .collection(Collections.items)
          .where('groupId', isEqualTo: groupId)
          .get();
      for (final doc in itemsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Delete from sessions
      final sessionsSnapshot = await super
          .firebaseFirestore
          .collection(Collections.counterSession)
          .where('groupId', isEqualTo: groupId)
          .get();
      for (final doc in sessionsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Commit the batch operation
      await batch.commit();

      return const RemoteResponse.success(null);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }
}
