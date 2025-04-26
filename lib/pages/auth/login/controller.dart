import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kurakani/common/apis/apis.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/routes/routes.dart';
import 'package:kurakani/common/store/store.dart';
import 'package:kurakani/pages/auth/login/index.dart';

import '../../../common/utils/loading.dart';

class LoginController extends GetxController {
  LoginState state;

  LoginController({required this.state});

  final _googleSignIn = GoogleSignIn(scopes: ["openid"]);

  final _googleAuth = FirebaseAuth.instance;
  final _userStore = UserStore.to;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<dynamic> loginInWithGoogle() async {
    try {
      await requestNotificationPermission();

      final account = await _googleSignIn.signIn();

      if (account == null) {
        return null;
      }

      final authentication = await account.authentication;

      final userCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final result = await _googleAuth.signInWithCredential(userCredential);
      log("result: $result");
      String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";

      print('fcmToken: ${fcmToken}');

      final user = UserItem(
        type: 1,
        name: account.displayName,
        description: "",
        avatar: account.photoUrl,
        online: 1,
        // access_token: userCredential.accessToken,
        fcm_token: fcmToken,
        token: result.user?.uid,
      );

      await saveUserData(user);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString(), name: "dfasdas");
      return null;
    } catch (e) {
      print('Messagesdfs');
      log(e.toString());
      return null;
    }
  }

  void loginInWithEmailAndPassword() async {
    String email = emailController.text;
    String password = passwordController.text;
    Loading.show("Logging user...");

    print('$email, $password');

    final user = await UserAPI.loginUserWithEmailAndPassword(email, password);

    Loading.dismiss();
    if (user is UserItem) {
      print('user: $user');
      await _userStore.saveProfile(user);
      Get.offAllNamed(AppRoutes.Message);
    } else {
      Loading.toast(user);
    }
  }

  saveUserData(UserItem user) async {
    try {
      final loginEntity = LoginRequestEntity(
          type: user.type,
          name: user.name,
          description: user.description,
          avatar: user.avatar,
          online: user.online,
          token: user.token,
          fcm_token: user.fcm_token);
      print('req user : ${loginEntity.fcm_token}');
      final response = await UserAPI.Login(params: loginEntity);

      log("response: $response");

      if (response.code == -1) {
        // show error dialog when there is error;
        String? errorMessage = response.msg;
        print(errorMessage);
        return;
      }

      print("response: $response}");
      await _userStore.saveProfile(response.data!);
      Get.offAllNamed(AppRoutes.Message);
    } catch (e) {
      // handle error
      print(e.toString());
    }
  }

  Future<void> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final res = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
