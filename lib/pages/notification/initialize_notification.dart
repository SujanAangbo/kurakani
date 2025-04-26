import 'package:awesome_notifications/awesome_notifications.dart';

class InitializeNotification {
  InitializeNotification() {
    _initialize();
  }

  _initialize() async {
    bool isInitialized = await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: "call",
          channelName: "Call notification",
          channelDescription: "This is notification description",
          channelShowBadge: true,
          importance: NotificationImportance.Max,
          soundSource: "resource://raw/ringtone",
          playSound: true,
          enableVibration: true,
        ),
        NotificationChannel(
          channelKey: "message",
          channelName: "Message notification",
          channelDescription: "This is notification description",
          channelShowBadge: true,
          importance: NotificationImportance.Max,
          soundSource: "resource://raw/notification",
          playSound: true,
          enableVibration: true,
        )
      ],
    );
    print('Notification Initialized: $isInitialized');
  }
}
