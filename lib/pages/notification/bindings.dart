import 'package:get/get.dart';
import 'package:kurakani/pages/notification/index.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    final arguments = Get.arguments;
    Get.lazyPut<NotificationController>(
      () => NotificationController(
        NotificationState(),
        arguments['message']
      ),
    );
  }
}
