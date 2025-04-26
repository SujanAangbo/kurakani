import 'package:get/get.dart';
import 'package:kurakani/pages/auth/welcome/controller.dart';
import 'package:kurakani/pages/auth/welcome/state.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(
        state: WelcomeState(),
      ),
    );
  }
}
