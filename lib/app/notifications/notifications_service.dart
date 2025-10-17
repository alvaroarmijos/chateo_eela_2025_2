import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final _flutterLocalNotifications = FlutterLocalNotificationsPlugin();
  final _firebaseMessaging = FirebaseMessaging.instance;

  final channel = AndroidNotificationChannel(
    'chat',
    'Chat Notifications',
    description: 'Canal usado para las notificaciones de nuevos mensajes',
    importance: Importance.high,
  );

  Future<void> setupNotifications() async {
    await _flutterLocalNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _firebaseMessaging.requestPermission();
  }

  void showNotification(RemoteMessage remoteMessage) {
    final remoteNotification = remoteMessage.notification;
    final androidNotification = remoteNotification?.android;

    if (remoteNotification != null) {
      if (androidNotification != null) {
        _flutterLocalNotifications.show(
          0,
          remoteNotification.title,
          remoteNotification.body,

          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'launch_background',
            ),
          ),
          // payload: 'test',
        );
      }
    }
  }
}
