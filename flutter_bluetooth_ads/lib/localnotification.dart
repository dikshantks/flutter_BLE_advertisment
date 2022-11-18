import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localnotifcation = FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);

    await _localnotifcation.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotification);
  }

  Future<NotificationDetails> _notifcationdetail() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelid", "channel name",
            channelDescription: 'one',
            importance: Importance.max,
            playSound: true);

    return NotificationDetails(android: androidNotificationDetails);
  }

  Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    final details = await _notifcationdetail();
    await _localnotifcation.show(id, title, body, details);
  }

  void onDidReceiveNotification(NotificationResponse details) {
    print(details.payload);
  }
}
