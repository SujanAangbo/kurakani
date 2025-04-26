import 'package:get/get.dart';
import 'package:kurakani/pages/auth/signup/index.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(
        state: SignupState(),
      ),
    );
  }
}
