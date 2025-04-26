import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kurakani/common/apis/apis.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/store/store.dart';
import 'package:kurakani/common/store/user.dart';
import 'package:kurakani/pages/profile/index.dart';

class ProfileController extends GetxController {
  ProfileState state;

  ProfileController({required this.state}) {
    nameController.text = state.user.value.name ?? "";
    emailController.text = state.user.value.email ?? "";
    descriptionController.text = state.user.value.description ?? "";
    phoneController.text = state.user.value.phone ?? "";
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  UserStore userStore = UserStore.to;

  Future<String?> updateProfilePicture(File image) async {
    log("updating profile picture");
    return await UserAPI.updateProfilePicture(image);
  }

  void updateProfile() async {
    String name = nameController.text;
    String email = emailController.text;
    String description = descriptionController.text;
    String phone = phoneController.text;

    print(state.user.value.token);

    String? imageUrl;
    if(state.selectedImage.value != null) {
      imageUrl = await updateProfilePicture(state.selectedImage.value!);
    }

    UserItem updatedUser = await UserAPI.updateUserProfile(
      userStore.profile.token ?? "",
      name,
      email,
      description,
      phone,
      imageUrl,
    );

    await userStore.saveProfile(updatedUser);
    Get.back();
  }

  selectProfileImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    if(pickedFile == null) return;

    state.selectedImage.value = File(pickedFile.path);
  }

}
