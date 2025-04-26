import 'package:get/get.dart';
import 'package:kurakani/pages/contact/index.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactState());
    Get.lazyPut<ContactController>(
      () => ContactController(
        state: Get.find(),
      ),
    );
  }
}
