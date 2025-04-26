import 'dart:developer';

import 'package:get/get.dart';
import 'package:kurakani/common/routes/names.dart';
import 'package:kurakani/pages/auth/welcome/state.dart';

class WelcomeController extends GetxController {
  WelcomeState state;

  WelcomeController({required this.state});

  final String appTitle = "KuraKani.";

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(AppRoutes.Message),
    );
  }
}
