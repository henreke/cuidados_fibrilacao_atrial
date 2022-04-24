import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotificationService {
  //Singleton pattern
  static final NotificationService _notificationService =
  NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const channelId = '123';

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  AndroidNotificationDetails _androidNotificationDetails =
  AndroidNotificationDetails(
    channelId,
    'FibAtrialApp',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  Future<void> showNotifications({String titulo = 'titulo',String msg = 'msg',int id=0,String payload = 'payload'}) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      titulo,
      msg,
      NotificationDetails(android: _androidNotificationDetails),
      payload: payload,
    );
  }

  Future<void> scheduleNotifications({String titulo = 'titulo',String msg = 'msg',int id=0,String payload ='payload'}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        titulo,
        msg,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload
    );
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }


}
Future selectNotification(String? payload) async {
  print(payload);
}