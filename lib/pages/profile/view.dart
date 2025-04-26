import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/utils/utils.dart';
import 'package:kurakani/common/values/colors.dart';
import 'package:kurakani/common/values/server.dart';
import 'package:kurakani/pages/home/index.dart';
import 'package:kurakani/pages/profile/controller.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({super.key});

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Stack(
                    children: [
                      Obx(() {
                        final user = controller.state.user.value;
                        final selectedImage =
                            controller.state.selectedImage.value;

                        return InkWell(
                          borderRadius: BorderRadius.circular(10),
                          radius: 100,
                          splashColor: Colors.grey.withOpacity(0.2),
                          // onTap: controller.selectProfileImage,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: selectedImage == null
                                ? user.avatar == null || user.avatar!.isEmpty
                                    ? const AssetImage(
                                        "assets/images/love.jpeg")
                                    : user.avatar!.contains("http")
                                        ? NetworkImage(user.avatar!)
                                        : NetworkImage(IMAGE_URL + user.avatar!)
                                : FileImage(selectedImage),
                          ),
                        );
                      }),
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
                const SizedBox(height: 20),
                Text(
                  "Full Name: ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: controller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name should not be empty";
                    } else if (value.length <= 5) {
                      return "Name should be more than 5 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Email: ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else if (value.isNotEmpty) {
                      bool isEmail = duIsEmail(value);
                      if (isEmail) {
                        return null;
                      } else {
                        return "Invalid email address";
                      }
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Description: ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: controller.descriptionController,
                ),
                const SizedBox(height: 10),
                Text(
                  "Phone Number: ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  controller: controller.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else if (value.isNotEmpty) {
                      bool isPhone = value.length == 10;
                      if (isPhone) {
                        return null;
                      } else {
                        return "Phone number should be of length 10";
                      }
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  text: "Update",
                  background: AppColors.primaryElement,
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      controller.updateProfile();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
