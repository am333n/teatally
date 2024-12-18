import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'failure.dart'; // Assuming Failure class is already defined

mixin BaseFirebase {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Add a document or item to any Firestore collection
  Future<RemoteResponse> addItem(
    String collectionPath,
    Map<String, dynamic> data, {
    String? uniqueField, // Optional: the field to check for uniqueness
  }) async {
    try {
      // Check if the document already exists by the unique field (if provided)
      if (uniqueField != null && data.containsKey(uniqueField)) {
        final querySnapshot = await firebaseFirestore
            .collection(collectionPath)
            .where(uniqueField, isEqualTo: data[uniqueField])
            .get();

        // If any document exists with the same value, return a failure
        if (querySnapshot.docs.isNotEmpty) {
          return RemoteResponse.failure(
            Failure.serverError(message: '$uniqueField already exists.'),
          );
        }
      }

      final response =
          await firebaseFirestore.collection(collectionPath).add(data);
      return RemoteResponse.success(response);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleGenericException(e as Exception));
    }
  }

  // Get a document or item from Firestore
  BaseReturnType getItem(
    String collectionPath,
    String documentId,
  ) async {
    try {
      final docSnapshot = await firebaseFirestore
          .collection(collectionPath)
          .doc(documentId)
          .get();
      if (docSnapshot.exists) {
        return RemoteResponse.success(docSnapshot.data());
      } else {
        return RemoteResponse.failure(
            Failure.serverError(message: 'Document not found.'));
      }
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  // Update an existing document or item in Firestore
  BaseReturnType updateItem(
    String collectionPath,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    try {
      await firebaseFirestore
          .collection(collectionPath)
          .doc(documentId)
          .update(data);
      return RemoteResponse.success(null);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  // Delete a document or item from Firestore
  BaseReturnType deleteItem(
    String collectionPath,
    String documentId,
  ) async {
    try {
      await firebaseFirestore
          .collection(collectionPath)
          .doc(documentId)
          .delete();
      return RemoteResponse.success(null);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  // Fetch all documents from a collection as a list of maps
  BaseReturnType getAllItems(String collectionPath) async {
    try {
      final snapshot = await firebaseFirestore.collection(collectionPath).get();
      List<Map<String, dynamic>> items =
          snapshot.docs.map((doc) => doc.data()).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  BaseReturnType getAllItemsExceptCurrentUser(
    String collectionPath,
  ) async {
    final currentUserId = await CredentialStorage.getUid();
    try {
      final snapshot = await firebaseFirestore
          .collection(collectionPath)
          .where('uid', isNotEqualTo: currentUserId) // Exclude current user
          .get();
      List<Map<String, dynamic>> items =
          snapshot.docs.map((doc) => doc.data()).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  BaseReturnType getAllItemsOfCurrentUser(
    String collectionPath,
  ) async {
    final currentUserId = await CredentialStorage.getUid();
    try {
      final snapshot = await firebaseFirestore
          .collection(collectionPath)
          .where('uid', isEqualTo: currentUserId)
          .get();
      List<Map<String, dynamic>> items =
          snapshot.docs.map((doc) => doc.data()).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  // Fetch documents by a specific field value in a collection
  BaseReturnType getItemsByQuery(
    String collectionPath, {
    required String field,
    required dynamic value,
  }) async {
    try {
      final snapshot = await firebaseFirestore
          .collection(collectionPath)
          .where(field, isEqualTo: value)
          .get();
      List<Map<String, dynamic>> items =
          snapshot.docs.map((doc) => doc.data()).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  Stream<RemoteResponse> getStreamItems(String collectionPath) {
    try {
      final stream = firebaseFirestore
          .collection(collectionPath)
          .snapshots()
          .map((snapshot) {
        List<Map<String, dynamic>> items =
            snapshot.docs.map((doc) => doc.data()).toList();
        return RemoteResponse.success(items);
      });
      return stream;
    } on FirebaseException catch (e) {
      return Stream.value(RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code)));
    } catch (e) {
      return Stream.value(
          RemoteResponse.failure(Failure.serverError(message: e.toString())));
    }
  }
}
