import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'failure.dart'; // Assuming Failure class is already defined

mixin BaseFirebase {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Add a document or item to any Firestore collection
  Future<RemoteResponse> addItem(
    String collectionPath,
    Map<String, dynamic> data, {
    String? uniqueField, // Optional: the field to check for uniqueness
  }) async {
    try {
      final userId = firebaseAuth.currentUser?.uid;

      if (userId == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'User is not authenticated.'));
      }

      // Check for uniqueness if needed
      if (uniqueField != null && data.containsKey(uniqueField)) {
        final querySnapshot = await firebaseFirestore
            .collection(collectionPath)
            .where(uniqueField, isEqualTo: data[uniqueField])
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          return RemoteResponse.failure(
            Failure.serverError(message: '$uniqueField already exists.'),
          );
        }
      }

      final response =
          await firebaseFirestore.collection(collectionPath).add(data);

      return RemoteResponse.success({'docId': response.id, 'userId': userId});
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<RemoteResponse> getItem(
    String collectionPath,
    String documentId,
  ) async {
    try {
      final docSnapshot = await firebaseFirestore
          .collection(collectionPath)
          .doc(documentId)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        data['docId'] = docSnapshot.id;
        return RemoteResponse.success(data);
      } else {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'Document not found.'));
      }
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  Future<RemoteResponse> updateItem(
    String collectionPath,
    String? documentId,
    Map<String, dynamic> data,
  ) async {
    try {
      if (documentId == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'Invalid documentId'));
      }

      await firebaseFirestore
          .collection(collectionPath)
          .doc(documentId)
          .update(data);
      return RemoteResponse.success({'docId': documentId});
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  Future<RemoteResponse> deleteItem(
    String collectionPath,
    String? documentId,
  ) async {
    try {
      final userId = firebaseAuth.currentUser?.uid;

      if (userId == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'User is not authenticated.'));
      }
      if (documentId == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'documentId Invalid'));
      }

      await firebaseFirestore
          .collection(collectionPath)
          .doc(documentId)
          .delete();

      return RemoteResponse.success({'docId': documentId});
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  // Fetch all documents from a collection as a list of maps
  Future<RemoteResponse> getAllItems(String collectionPath) async {
    try {
      final userId = firebaseAuth.currentUser?.uid;

      if (userId == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'User is not authenticated.'));
      }

      final snapshot = await firebaseFirestore.collection(collectionPath).get();
      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  Future<RemoteResponse> getAllItemsExceptCurrentUser(
    String collectionPath,
  ) async {
    final userId = firebaseAuth.currentUser?.uid;

    if (userId == null) {
      return const RemoteResponse.failure(
          Failure.serverError(message: 'User is not authenticated.'));
    }

    try {
      final snapshot = await firebaseFirestore
          .collection(collectionPath)
          .where('userId', isNotEqualTo: userId)
          .get();
      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

  // Fetch documents for the current user
  Future<RemoteResponse> getAllItemsOfCurrentUser(
    String collectionPath,
  ) async {
    final userId = firebaseAuth.currentUser?.uid;

    if (userId == null) {
      return const RemoteResponse.failure(
          Failure.serverError(message: 'User is not authenticated.'));
    }

    try {
      final snapshot = await firebaseFirestore
          .collection(collectionPath)
          .where('userId', isEqualTo: userId)
          .get();
      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();
      return RemoteResponse.success(items);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }
}
