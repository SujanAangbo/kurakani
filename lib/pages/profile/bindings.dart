import 'package:get/get.dart';
import 'package:kurakani/pages/profile/index.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        state: ProfileState(
          args['user'],
        ),
      ),
    );
  }
}
