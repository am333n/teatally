import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/notification_model.dart';
import 'package:teatally/core/common/notification_service_remote_service.dart';
import 'package:teatally/core/common/send_notification_model.dart';
import 'package:teatally/core/infrastructure/base_repository.dart';

@injectable
class NotificationServiceRepository with BaseRepo {
  final NotificationServiceRemoteService _remoteService;

  NotificationServiceRepository(this._remoteService);
  RepoResponse<bool> updateFCMToken(
    String fcmToken,
    String deviceName,
    String deviceID,
    String? deviceDisplayName,
  ) {
    return super.performAction(
      () => _remoteService.updateFCMToken(
        fcmToken,
        deviceName,
        deviceID,
        deviceDisplayName,
      ),
    );
  }

  RepoResponse<bool> sendNotifications(SendNotificationModel notifications) {
    return super
        .performAction(() => _remoteService.sendNotification(notifications));
  }

  RepoResponse<List<NotificationModel>> getAllUsersFCM(List<String> userUIDs) {
    return super.getListData(() => _remoteService.getAllUsersFCM(userUIDs),
        NotificationModel.fromJson);
  }
}
