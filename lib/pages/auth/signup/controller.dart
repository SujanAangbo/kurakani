import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kurakani/common/apis/apis.dart';
import 'package:kurakani/common/utils/loading.dart';
import 'package:kurakani/pages/auth/signup/index.dart';

class SignupController extends GetxController {
  SignupState state;

  SignupController({required this.state});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  selectProfileImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    if(pickedFile == null) return;

    state.image.value = File(pickedFile.path);
    state.error.value = "";

  }

  signup() async {

    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    File image = state.image.value!;

    Loading.show("Creating user...");

    print('$name, $email, $password, $phone, $image');

    final user = await UserAPI.createUserWithEmailAndPassword(name, email, password, phone, image);
    Loading.dismiss();
    Loading.toast("User created successfully");
    if(user is String) {
      Loading.toast(user);
    } else {
      // navigate to login
      Get.back();
    }
  }

}
