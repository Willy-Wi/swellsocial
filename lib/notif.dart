import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notif {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/swell_social_logo');
    var iOSInitialize = new DarwinInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification(
      {required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
      'channel_3000',
      'channel_swellsocial',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: DarwinNotificationDetails());
    await fln.show(0, title, body, not);
  }
}
