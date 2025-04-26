import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/apis/apis.dart';
import 'package:kurakani/common/entities/chatroom_model.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/routes/names.dart';
import 'package:kurakani/common/store/store.dart';
import 'package:kurakani/common/values/server.dart';
import 'package:kurakani/pages/home/index.dart';

class HomeController extends GetxController {
  HomeState state;
  final userStore = UserStore.to;

  final _firestore = FirebaseFirestore.instance;
  late StreamSubscription chatroomSubscription;

  HomeController({required this.state}) {
    getAllChatroom();
    // markAsOnline();
  }

  void markAsOnline() {
    // request
    UserAPI.updateUserOnlineStatus(userStore.profile.token ?? "", 1);
  }

  void markAsOffline() {
    // request
    UserAPI.updateUserOnlineStatus(userStore.profile.token ?? "", 0);
  }

  void getAllChatroom() {
    print('token: ${userStore.profile.token}');
    final chatroomStream = _firestore
        .collection(CHATROOM)
        .where("participants", arrayContains: userStore.profile.token)
        .where("isCommunicated", isEqualTo: true)
        .orderBy("updatedAt", descending: true)
        .snapshots();

    chatroomSubscription = chatroomStream.listen((snapshot) {
      final data = snapshot.docs;

      final chatroomList = data
          .map(
            (doc) => ChatRoomModel.fromJson(doc.data()),
          )
          .toList();
      print('chatroomlist: $chatroomList');
      state.chatrooms.value = chatroomList;
    });
  }

  Future<ContactItem> getUserDetails(List<String> participants) async {
    participants.remove(userStore.profile.token);

    String friendId = participants.first;
    participants.add(userStore.profile.token ?? "");
    return await UserAPI.getUserById(friendId);
  }

  navigateProfilePage() async {
    await Get.toNamed(AppRoutes.Profile, arguments: {"user": state.user});
    String profileString = await userStore.getProfile();
    state.user.value = UserItem.fromJson(jsonDecode(profileString));
  }

  @override
  void dispose() {
    markAsOffline();
    super.dispose();
    chatroomSubscription.cancel();
  }

  logout() async {
    markAsOffline();
    await FirebaseAuth.instance.signOut();
    userStore.onLogout();
  }
}
