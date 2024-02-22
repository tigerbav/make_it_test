import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:make_it/common/app_constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationProvider {
  static final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();

  static notificationDetails(String chanelID) => NotificationDetails(
        android: AndroidNotificationDetails(
          chanelID,
          'Make IT',
          channelDescription: 'Test task',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      );

  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  static Future init() async {
    tz.initializeTimeZones();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    const initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  static Future showScheduleNotification({
    required int id,
    required String body,
    required Duration duration,
  }) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      C.notification,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      notificationDetails(id.toString()),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future showPeriodicNotifications({
    required String body,
    required int id,
  }) async {
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      C.notification,
      body,
      RepeatInterval.everyMinute,
      notificationDetails(id.toString()),
    );
  }

  static Future cancel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
