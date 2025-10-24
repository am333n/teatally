import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'failure.dart'; // Assuming Failure class is already defined

mixin BaseFirebase {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final userData = getIt<AuthCubit>().state.status.getUserDataOrNull();
  // Add a document or item to any Firestore collection
  Future<RemoteResponse> addItem(
    String collectionPath,
    Map<String, dynamic> data, {
    String? uniqueField, // Optional: the field to check for uniqueness
  }) async {
    try {
      final userId = userData?.uid;

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

  Future<RemoteResponse> getItemWhere(
    String collectionPath, {
    required String field,
    required dynamic value,
    bool isEqualTo = true,
  }) async {
    try {
      Query query = firebaseFirestore.collection(collectionPath);

      if (isEqualTo) {
        query = query.where(field, isEqualTo: value);
      } else {
        query = query.where(field, isNotEqualTo: value);
      }

      final querySnapshot = await query.limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        final data = doc.data() as Map<String, dynamic>? ?? {};
        data['docId'] = doc.id;
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
  // ... your existing methods ...

  Future<RemoteResponse> updateMultipleDocuments({
    required List<String> docIds,
    required String collectionPath,
    required Map<String, dynamic> updateData,
  }) async {
    try {
      final userId = userData?.uid;
      if (userId == null) {
        return const RemoteResponse.failure(
            Failure.serverError(message: 'User is not authenticated.'));
      }

      final batch = firebaseFirestore.batch();

      for (final docId in docIds) {
        final docRef = firebaseFirestore.collection(collectionPath).doc(docId);
        batch.update(docRef, updateData);
      }

      await batch.commit();

      return RemoteResponse.success({
        'updatedCount': docIds.length,
        'docIds': docIds,
      });
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(Failure.firebaseNetworkError(
          message: e.message ?? 'Unknown error', code: e.code));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

// Get all items based on multiple field-value conditions
  Future<RemoteResponse> getAllItemsWhere(
    String collectionPath, {
    Map<String, dynamic>? whereConditions,
    List<MapEntry<String, dynamic>>? whereInConditions,
    int? limit,
    String? orderByField,
    bool descending = false, // Add this parameter
  }) async {
    try {
      Query query = firebaseFirestore.collection(collectionPath);

      // Apply simple where conditions (field == value)
      if (whereConditions != null && whereConditions.isNotEmpty) {
        whereConditions.forEach((field, value) {
          query = query.where(field, isEqualTo: value);
        });
      }

      // Apply whereIn conditions (field in [value1, value2, ...])
      if (whereInConditions != null && whereInConditions.isNotEmpty) {
        for (final condition in whereInConditions) {
          if (condition.value is List) {
            query =
                query.where(condition.key, whereIn: condition.value as List);
          }
        }
      }

      // Apply ordering if provided
      if (orderByField != null) {
        query = query.orderBy(orderByField, descending: descending);
      }

      // Apply limit if provided
      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();

      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>? ?? {};
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

// Advanced query with multiple conditions
  Future<RemoteResponse> getAllItemsWithConditions(
    String collectionPath, {
    List<QueryCondition> conditions = const [],
    int? limit,
    String? orderByField,
    bool descending = false,
  }) async {
    try {
      Query query = firebaseFirestore.collection(collectionPath);

      // Apply all conditions
      for (final condition in conditions) {
        switch (condition.operator) {
          case QueryOperator.isEqualTo:
            query = query.where(condition.field, isEqualTo: condition.value);
            break;
          case QueryOperator.isNotEqualTo:
            query = query.where(condition.field, isNotEqualTo: condition.value);
            break;
          case QueryOperator.isLessThan:
            query = query.where(condition.field, isLessThan: condition.value);
            break;
          case QueryOperator.isLessThanOrEqualTo:
            query = query.where(condition.field,
                isLessThanOrEqualTo: condition.value);
            break;
          case QueryOperator.isGreaterThan:
            query =
                query.where(condition.field, isGreaterThan: condition.value);
            break;
          case QueryOperator.isGreaterThanOrEqualTo:
            query = query.where(condition.field,
                isGreaterThanOrEqualTo: condition.value);
            break;
          case QueryOperator.arrayContains:
            query =
                query.where(condition.field, arrayContains: condition.value);
            break;
          case QueryOperator.whereIn:
            // Ensure the value is a List for whereIn
            if (condition.value is List) {
              query = query.where(condition.field,
                  whereIn: condition.value as List);
            }
            break;
          case QueryOperator.arrayContainsAny:
            // Ensure the value is a List for arrayContainsAny
            if (condition.value is List) {
              query = query.where(condition.field,
                  arrayContainsAny: condition.value as List);
            }
            break;
        }
      }

      // Apply ordering
      if (orderByField != null) {
        query = query.orderBy(orderByField, descending: descending);
      }

      // Apply limit
      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();

      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>? ?? {};
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
      final userId = userData?.uid;

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
      final userId = userData?.uid;

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
    final userId = userData?.uid;

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
    final userId = userData?.uid;

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

// Supporting classes for advanced queries
enum QueryOperator {
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  whereIn,
  arrayContainsAny,
}

class QueryCondition {
  final String field;
  final dynamic value;
  final QueryOperator operator;

  const QueryCondition({
    required this.field,
    required this.value,
    required this.operator,
  });
}
