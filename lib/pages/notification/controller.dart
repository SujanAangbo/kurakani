
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:kurakani/pages/notification/index.dart';

class NotificationController extends GetxController {

  NotificationState state;
  RemoteMessage remoteMessage;

  NotificationController(this.state, this.remoteMessage);

}
