import 'package:get/get.dart';
import 'package:kurakani/pages/home/index.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeState>(() => HomeState());
    Get.lazyPut<HomeController>(
      () => HomeController(
        state: Get.find(),
      ),
    );
  }
}
