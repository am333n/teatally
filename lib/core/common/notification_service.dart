// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/device_info_service.dart';
import 'package:teatally/core/common/local_notification_service.dart';
import 'package:teatally/core/common/notification_service_repository.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/widgets/toast.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';

import 'package:teatally/features/auth/infrastructure/credential_storage.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await getIt<LocalNotificationService>().init();
  await getIt<NotificationService>().showNotification(message);
}

@singleton
class NotificationService {
  NotificationService(this._repository);
  final NotificationServiceRepository _repository;
  final _messaging = FirebaseMessaging.instance;
  Future<void> initialize() async {
    try {
      // Set background message handler
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      // Request permission
      await _requestPermission();

      String? apnsToken;

      // Handle iOS-specific APNs token
      if (Platform.isIOS) {
        try {
          apnsToken = await _messaging.getAPNSToken();

          if (apnsToken == null) {
            print("⚠️ APNs token not available");
          } else {
            print("✅ APNs Token: $apnsToken");
            // Wait 3 seconds before requesting FCM token
            await Future.delayed(const Duration(seconds: 3));
          }
        } catch (e) {
          print('❌ APNs token retrieval error: $e');
        }
      }

      // Get FCM token (only once, after APNs delay if iOS)
      try {
        final token = await FirebaseMessaging.instance.getToken();
        if (token != null) {
          print('✅ FCM Token: $token');
          if (getIt<AuthCubit>().state is Authenticated) {
            sendFcmTokenToServer(token);
          } else {
            saveFcmToken(token);
          }
        } else {
          print('❌ Failed to get FCM token');
        }
      } catch (e, stacktrace) {
        print('❌ FCM token retrieval error: $e \n $stacktrace');
      }

      // Setup token refresh listener
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        print('🔄 FCM Token refreshed: $newToken');
        if (newToken != null && newToken.isNotEmpty) {
          sendFcmTokenToServer(newToken);
        }
      });

      // Setup message handlers
      await _setupMessageHandlers();
    } catch (e) {
      print('❌ NotificationService initialization failed: $e');
      rethrow;
    }
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );

    print('Permission status: ${settings.authorizationStatus.name}');
  }

  Future<void> saveFcmToken(String fcmToken) async {
    await CredentialStorage.updateFcmToken(token: fcmToken);
  }

  Future<void> sendFcmTokenToServer(String token) async {
    try {
      final deviceInfoService = getIt<DeviceInfoService>();
      await CredentialStorage.updateFcmToken(token: token);
      final deviceName = await deviceInfoService.getDeviceName() ?? 'unknown';
      final deviceID = await deviceInfoService.getDeviceId() ?? 'unknown';
      final deviceModel = await deviceInfoService.getDeviceModel() ?? 'unknown';
      final response = await _repository.updateFCMToken(
        token,
        deviceModel,
        deviceID,
        deviceName,
      );
      response.fold(
        (f) {
          Toast.showErrorMessage(f.toString());
        },
        (r) {
          print('Fcm Successfully uploaded to server');
        },
      );
    } catch (e, stack) {
      // 4️⃣ Handle errors
      print('❌ Failed to send FCM token: $e');
      print(stack);
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      await getIt<LocalNotificationService>().showPushNotification(message);
    }
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // opened app
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      handleNotificationClick(message.data);
    }
  }

  static void handleNotificationClick(Map<String, dynamic> payload) {
    if (!payload.containsKey('URL') || payload['URL'] is! String) return;

    final String url = payload['URL'].trim();
    final parts = url.split('/').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return;

    final String type = parts[1];
    final String? id = parts.length > 2 ? parts[2] : null;

    // switch (type) {
    //   case 'alert':
    //     if (id != null) {
    //       print("🚨 Opening alert with ID: $id");
    //       getIt<AppRouter>().push(DocumentListingRoute());
    //       final context = getIt<AppRouter>().navigatorKey.currentContext;
    //       if (context != null) {
    //         context.read<DocumentListingBloc>().add(
    //               DocumentListingEvent.setAlertFromHomeScreen(
    //                 int.tryParse(id) ?? 0,
    //               ),
    //             );
    //       }
    //     } else {
    //       getIt<AppRouter>().push(HomeRoute());
    //     }
    //     break;
    //   case 'document':
    //     if (id != null) {
    //       print("📄 Opening document with ID: $id");
    //     } else {
    //       print("📄 Opening document list");
    //     }
    //     break;
    //   default:
    //     print("ℹ️ Unknown URL type: $type");
    // }
  }
}
