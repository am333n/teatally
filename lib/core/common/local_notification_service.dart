import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/notification_service.dart';

@lazySingleton
class LocalNotificationService {
  LocalNotificationService();

  // Channel name constants

  static const String sessionChannel = 'session_channel';

  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_stat_icon',
    );
    const iosSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        final payload = response.payload ?? '';
        log(payload.toString());
        if (payload.startsWith('{') && payload.contains('"isDownload":true')) {
          // _handleDownloadClick(payload, response.id);
        } else {
          NotificationService.handleNotificationClick(_parsePayload(payload));
        }
      },
    );

    await _requestPermissions();
    await _createChannels();

    _initialized = true;
  }

  Future<void> _requestPermissions() async {
    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> _createChannels() async {
    final android = notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await android?.createNotificationChannel(
      const AndroidNotificationChannel(
        sessionChannel,
        'Session Notifications',
        description: 'Session Notifications',
        importance: Importance.high,
      ),
    );
  }

  // -------------------- GENERAL PUSH NOTIFICATIONS --------------------

  Future<void> showPushNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await notifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            sessionChannel,
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_stat_icon',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: jsonEncode(message.data),
      );
    }
  }

  Map<String, dynamic> _parsePayload(String payload) {
    try {
      return Map<String, dynamic>.from(jsonDecode(payload));
    } catch (_) {
      return {"data": payload};
    }
  }
}
