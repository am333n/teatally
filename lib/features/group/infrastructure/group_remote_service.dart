import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';

@injectable
class GroupRemoteService with BaseFirebase {
  BaseReturnType getCategories(String? groupId) async {
    if (groupId == null) {
      return const RemoteResponse.failure(
          Failure.serverError(message: 'Invalid GroupId'));
    }
    try {
      final snapshot = await super
          .firebaseFirestore
          .collection(Collections.categories)
          .where('groupId', isEqualTo: groupId)
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

  BaseReturnType getItemsForGroup(String? groupId) async {
    if (groupId == null) {
      return const RemoteResponse.failure(
          Failure.serverError(message: 'Invalid GroupId'));
    }
    try {
      final snapshot = await super
          .firebaseFirestore
          .collection(Collections.items)
          .where('groupId', isEqualTo: groupId)
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

  BaseReturnType addCategory(CategoriesModel categoryDetail) {
    categoryDetail = categoryDetail.copyWith(createdBy: super.userData?.uid);
    return super.addItem(Collections.categories, categoryDetail.toJson());
  }

  BaseReturnType updateCategory(CategoriesModel categoryDetail) {
    return super.updateItem(
        Collections.categories, categoryDetail.docId, categoryDetail.toJson());
  }

  BaseReturnType deleteCategoryItem(String? itemDocID) {
    return super.deleteItem(Collections.items, itemDocID);
  }

  BaseReturnType deleteCategory(String docId) {
    return super.deleteItem(
      Collections.categories,
      docId,
    );
  }

  BaseReturnType deleteSession(String docId) {
    return super.deleteItem(
      Collections.counterSession,
      docId,
    );
  }

  BaseReturnType addActiveSession(SessionModel sessionDetails) {
    sessionDetails = sessionDetails.copyWith(
        startedBy: super.userData?.uid,
        startedByName: super.userData?.displayName,
        updatedBy: super.userData?.uid);
    return super.addItem(Collections.counterSession, sessionDetails.toJson());
  }

  BaseReturnType updateActiveSession(SessionModel sessionDetails) {
    sessionDetails = sessionDetails.copyWith(
        updatedAt: DateTime.now(), updatedBy: super.userData?.uid);
    Map<String, dynamic> sessionJson = sessionDetails.toJson();

    return super.updateItem(
        Collections.counterSession, sessionDetails.docId, sessionJson);
  }

  BaseReturnType requestOwnershipTransfer(SessionModel sessionDetails) {
    sessionDetails = sessionDetails.copyWith(
        transferRequest: TransferRequest(
            requesterName: super.userData?.displayName,
            time: DateTime.now(),
            accepted: null,
            orginalOwner: sessionDetails.startedBy,
            orginalOwnerName: sessionDetails.startedByName,
            requesterUid: super.userData?.uid));
    Map<String, dynamic> sessionJson = sessionDetails.toJson();
    return super.updateItem(
        Collections.counterSession, sessionDetails.docId, sessionJson);
  }

  BaseReturnType acceptOrRejectOwnershipTransfer(SessionModel sessionDetails) {
    Map<String, dynamic> sessionJson = sessionDetails.toJson();
    return super.updateItem(
        Collections.counterSession, sessionDetails.docId, sessionJson);
  }

  BaseReturnType addItemForCategory(ItemModel itemDetail) {
    itemDetail = itemDetail.copyWith(createdBy: super.userData?.uid);
    return super.addItem(Collections.items, itemDetail.toJson());
  }

  BaseReturnType getAllMemberDetails(List<String>? membersUids) async {
    if (membersUids == null || membersUids.isEmpty) {
      return const RemoteResponse.failure(
          Failure.serverError(message: 'Invalid members'));
    }

    try {
      String? currentUserUid = super.userData?.uid;
      List<String> filteredUids = List.from(membersUids);
      filteredUids.removeWhere((uid) => uid == currentUserUid);

      if (filteredUids.isEmpty) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'No members to query'));
      }
      final snapshot = await super
          .firebaseFirestore
          .collection(Collections.users)
          .where('uid', whereIn: filteredUids)
          .get();

      if (snapshot.docs.isEmpty) {
        return const RemoteResponse.success([]);
      }
      final data = snapshot.docs.map((doc) => doc.data()).toList();

      return RemoteResponse.success(data);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  Stream<RemoteResponse<dynamic>> streamLatestActiveSession(String groupId) {
    final currentUser = super.userData?.uid;
    return super
        .firebaseFirestore
        .collection(Collections.counterSession)
        .where('groupId', isEqualTo: groupId)
        .where('isActive', isEqualTo: true)
        .orderBy('updatedAt', descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();
        data['docId'] = doc.id;
        data['isCreatedByCurrentUser'] =
            (doc['startedBy'] == currentUser) ? true : false;
        return RemoteResponse.success(data);
      }
      return const RemoteResponse.success(null);
    }).handleError((error) {
      if (error is FirebaseException) {
        return RemoteResponse.failure(
            FailureHandler.handleFirestoreException(error));
      }
      return RemoteResponse.failure(
          Failure.serverError(message: error.toString()));
    });
  }
}
