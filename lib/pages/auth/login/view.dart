import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/routes/names.dart';
import 'package:kurakani/common/values/colors.dart';
import 'package:kurakani/pages/auth/login/controller.dart';
import 'package:kurakani/pages/home/index.dart';

import '../../../common/utils/validator.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),

                  Center(
                    child: Text(
                      "KuraKani .",
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryElement,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Email Address: ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: controller.emailController,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "email is required";
                      } else if(!duIsEmail(value)) {
                        return "invalid email address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Password: ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    controller: controller.passwordController,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "password is required";
                      } else if(value.length < 6) {
                        return "name should be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: "Login",
                    background: AppColors.primaryElement,
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        controller.loginInWithEmailAndPassword();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Don't have an account",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.Register);
                      },
                      child: Text(
                        "Sign Up here",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.primaryElement,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      Text(
                        "  OR  ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 160,
                      child: AuthButton(
                        asset: "assets/icons/google.png",
                        text: "Google",
                        onPressed: () {
                          controller.loginInWithGoogle();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 46),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String text;
  final String? asset;
  final Function() onPressed;

  const AuthButton({
    super.key,
    required this.text,
    this.asset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (asset != null)
              Image.asset(
                asset!,
                height: 20,
                width: 20,
              ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
