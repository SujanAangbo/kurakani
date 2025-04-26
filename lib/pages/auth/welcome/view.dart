import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/values/colors.dart';
import 'package:kurakani/pages/auth/welcome/controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: 800.h,
        width: 360.w,
        color: AppColors.primaryElement,
        child: Center(
          child: Text(
            controller.appTitle,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 45.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
