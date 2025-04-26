import 'package:get/get.dart';
import 'package:kurakani/pages/auth/login/index.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginState(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        state: Get.find(),
      ),
    );
  }
}
