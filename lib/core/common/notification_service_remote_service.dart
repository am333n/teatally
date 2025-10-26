import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/base_remote.dart';
import 'package:teatally/core/common/endpoints.dart';
import 'package:teatally/core/common/notification_model.dart';
import 'package:teatally/core/common/send_notification_model.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:uuid/uuid.dart';

@injectable
class NotificationServiceRemoteService with BaseFirebase, BaseRemote {
  BaseReturnType updateFCMToken(
    String fcmToken,
    String deviceName,
    String deviceID,
    String? deviceDisplayName,
  ) async {
    final user = super.userData;
    final existingUserResult = await super.getAllItemsWhere(
      Collections.notification,
      whereConditions: {'userUID': user?.uid},
    );

    if (existingUserResult is Success) {
      final existingUsers =
          existingUserResult.data as List<Map<String, dynamic>>;
      if (existingUsers.isNotEmpty) {
        final existingUser = existingUsers.first;
        // Preserve the existing UID - don't update it!
        final existingModel = NotificationModel.fromJson(existingUser);
        return await super.updateItem(
            Collections.notification,
            existingUser['docId'] as String,
            existingModel
                .copyWith(
                    fcmToken: fcmToken,
                    deviceName: deviceName,
                    deviceDisplayName: deviceDisplayName,
                    isActive: true,
                    lastUpdatedAt: DateTime.now(),
                    deviceID: deviceID)
                .toJson()
            // {
            //   'fcmToken': fcmToken,
            //   'deviceName': deviceName,
            //   'isActive': true,
            //   'deviceID': deviceID,
            //   'deviceDisplayName': deviceDisplayName,
            //   'lastUpdatedAt': DateTime.now(),
            // },
            );
      }
    }
    return super.addItem(
        Collections.notification,
        NotificationModel(
                uid: const Uuid().v4(),
                isActive: true,
                userId: user?.uid ?? 'Unknown',
                userName: user?.displayName ?? 'Unknown',
                fcmToken: fcmToken,
                deviceID: deviceID,
                deviceName: deviceName,
                deviceDisplayName: deviceDisplayName,
                lastUpdatedAt: DateTime.now())
            .toJson(),
        uniqueField: 'userUID');
  }

  BaseReturnType sendNotification(SendNotificationModel notifications) {
    return super.post(Endpoints.sendNotification, body: notifications.toJson());
  }

  BaseReturnType getAllUsersFCM(List<String> userUIDs) async {
    try {
      if (userUIDs.isEmpty) {
        return const RemoteResponse.success([]);
      }

      // If userUIDs count is more than 10, we need to batch the queries
      if (userUIDs.length > 10) {
        return await _getUsersFCMBatched(userUIDs);
      }

      // For 10 or fewer users, single query
      final usersSnapshot = await super
          .firebaseFirestore
          .collection(Collections.notification)
          .where(FieldPath.fromString('userUID'), whereIn: userUIDs)
          .where('isActive', isEqualTo: true)
          .get();

      List<Map<String, dynamic>> usersData = usersSnapshot.docs.map((doc) {
        final data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();

      return RemoteResponse.success(usersData);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }

// Batched version for more than 10 users
  BaseReturnType _getUsersFCMBatched(List<String> userUIDs) async {
    try {
      List<Map<String, dynamic>> allUsersData = [];

      for (int i = 0; i < userUIDs.length; i += 10) {
        final batchUIDs = userUIDs.sublist(
          i,
          i + 10 > userUIDs.length ? userUIDs.length : i + 10,
        );

        final usersSnapshot = await super
            .firebaseFirestore
            .collection(Collections.users)
            .where(FieldPath.documentId, whereIn: batchUIDs)
            .where('isActive', isEqualTo: true)
            .get();

        final batchUsersData = usersSnapshot.docs.map((doc) {
          final data = doc.data();
          data['docId'] = doc.id;
          return data;
        }).toList();

        allUsersData.addAll(batchUsersData);

        // Small delay to avoid hitting Firestore limits too quickly
        if (i + 10 < userUIDs.length) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
      }

      return RemoteResponse.success(allUsersData);
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(Failure.serverError(message: e.toString()));
    }
  }
}
