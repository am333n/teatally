import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/notification_model.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:uuid/uuid.dart';

@injectable
class NotificationServiceRemoteService with BaseFirebase {
  BaseReturnType updateFCMToken(
    String fcmToken,
    String deviceName,
    String deviceID,
    String? deviceDisplayName,
  ) async {
    final user = super.userData;
    final existingUserResult = await super.getAllItemsWhere(
      Collections.notification,
      whereConditions: {'uid': user?.uid},
    );

    if (existingUserResult is Success) {
      final existingUsers =
          existingUserResult.data as List<Map<String, dynamic>>;
      if (existingUsers.isNotEmpty) {
        final existingUser = existingUsers.first;
        final existingUid = existingUser['uid'] as String;

        // Preserve the existing UID - don't update it!
        return await super.updateItem(
          Collections.notification,
          existingUser['docId'] as String,
          {
            'fcmToken': fcmToken,
            'deviceName': deviceName,
            'deviceID': deviceID,
            'deviceDisplayName': deviceDisplayName,
            'lastUpdatedAt': FieldValue.serverTimestamp(),
          },
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
        uniqueField: 'uid');
  }
}
