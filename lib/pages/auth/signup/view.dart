import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/utils/utils.dart';
import 'package:kurakani/common/values/colors.dart';
import '../../home/view.dart';
import 'controller.dart';

class SignupPage extends GetView<SignupController> {
  SignupPage({super.key});

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
                  Center(
                    child: Stack(
                      children: [
                        Obx(
                          () => InkWell(
                            borderRadius: BorderRadius.circular(10),
                            radius: 100,
                            splashColor: Colors.grey.withOpacity(0.2),
                            onTap: controller.selectProfileImage,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: controller.state.image.value ==
                                      null
                                  ? const AssetImage("assets/images/love.jpeg")
                                  : FileImage(
                                      controller.state.image.value!,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: controller.selectProfileImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.state.error.value,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Full Name: ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: controller.nameController,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "name is required";
                      } else if(value.length < 5) {
                        return "name should be at least 5 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
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
                    "Phone Number: ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: controller.phoneController,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return null;
                      } else if(value.length != 10) {
                        return "phone number should be of 10 digits";
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
                    text: "Sign Up",
                    background: AppColors.primaryElement,
                    onPressed: () {
                      if (controller.state.image.value == null) {
                        controller.state.error.value = "Please select image";
                      }

                      print(controller.state.error.value);

                      if (formKey.currentState!.validate() &&
                          controller.state.image.value != null) {
                        controller.signup();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Already have an account",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.primaryElement,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
