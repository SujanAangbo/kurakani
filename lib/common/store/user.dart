import 'dart:convert';
import 'package:get/get.dart';

import '../entities/user.dart';
import '../routes/names.dart';
import '../services/storage.dart';
import '../values/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find<UserStore>();

  // Whether or not to log in
  final _isLogin = false.obs;
  // token
  String token = '';
  // user profile
  final _profile = UserItem().obs;

  bool get isLogin => _isLogin.value;
  UserItem get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    }
  }

  // save token
  Future<void> _setToken(String value) async {
    print("tokenee: $value");
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
    print("tokenee: $token");

  }

  // fetch profile
  Future<String> getProfile() async {
    print("hereeee: $token");
    if (token.isEmpty) return "";
    print('hereee');
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
   return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  // Save profile
  Future<void> saveProfile(UserItem profile) async {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    _profile(profile);
    _setToken(profile.access_token!);
  }

  // 注销
  Future<void> onLogout() async {
   // if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
    token = '';
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }
}
