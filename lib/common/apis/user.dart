import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kurakani/common/entities/contact.dart';
import 'package:kurakani/common/utils/loading.dart';

import '../entities/base.dart';
import '../entities/user.dart';
import '../utils/http.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> Login({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/login',
      data: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  static Future<ContactItem> getUserById(String id) async {
    final res = await HttpUtil().get("/api/user/$id");
    return ContactItem.fromJson(res["data"]);
  }

  static Future<ContactItem> updateUserOnlineStatus(
      String id, int status) async {
    final res = await HttpUtil().put("/api/user/status", data: {
      "id": id,
      "online": status,
    });
    return ContactItem.fromJson(res["data"]);
  }

  static Future<dynamic> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
    String phone,
    File image,
  ) async {
    String fcm = await FirebaseMessaging.instance.getToken() ?? "";

    MultipartFile photoMultipartFile = await MultipartFile.fromFile(
      image.path,
      filename: 'photo.jpg',
    );

    FormData body = FormData.fromMap({
      "password": password,
      "name": name,
      "email": email,
      "image": photoMultipartFile,
      "fcm_token": fcm,
      "phone": phone,
    });

    print(body);

    final res = await HttpUtil().post("/api/user/create", data: body);
    print('res: $res');
    if (res['code'] == 0) {
      return UserItem.fromJson(res["data"]);
    } else {
      return res["msg"];
    }
  }

  static Future<dynamic> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    Map<String, dynamic> body = {
      "password": password,
      "email": email,
    };

    final res = await HttpUtil().post("/api/user/", data: body);
    print('res: $res');
    if (res['code'] == 0) {
      return UserItem.fromJson(res["data"]);
    } else {
      return res["msg"];
    }
  }

  static Future<UserItem> updateUserProfile(
    String id,
    String name,
    String email,
    String description,
    String phone,
    String? image,
  ) async {
    Map<String, dynamic> body = {
      "user": id,
      "name": name,
      "email": email,
      "image": image,
      "description": description,
      "phone": phone,
    };

    print(body);

    final res = await HttpUtil().put("/api/user/profile", data: body);
    return UserItem.fromJson(res["data"]);
  }

  static Future<UserLoginResponseEntity> get_profile() async {
    var response = await HttpUtil().post(
      'api/get_profile',
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  static Future<String?> updateProfilePicture(File image) async {
    try {
      MultipartFile photoMultipartFile = await MultipartFile.fromFile(
        image.path,
        filename: 'photo.jpg',
      );

      FormData body = FormData.fromMap({
        "image": photoMultipartFile,
      });

      final res = await HttpUtil().put("/api/user/update-profile", data: body);
      print('res: $res');

      if (res['code'] == 0) {
        return res["data"];
      } else {
        return res["msg"];
      }
    } catch (e) {
      Loading.toast(e.toString());
      return null;
    }
  }

  static Future<BaseResponseEntity> UpdateProfile({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/update_profile',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }
}
