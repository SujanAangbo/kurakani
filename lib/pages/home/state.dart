import 'dart:convert';
import 'package:get/get.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/store/store.dart';

import '../../common/entities/chatroom_model.dart';

class HomeState {
  Rx<UserItem?> user = UserItem().obs;
  RxList<ChatRoomModel> chatrooms = <ChatRoomModel>[].obs;

  HomeState() {
    getUser();
  }

  getUser() async {
    final userJson = await UserStore.to.getProfile();
    print('inside state: ');
    print(userJson);
    if(userJson.isEmpty) {
      user.value = null;
    } else {
      user.value = UserItem.fromJson(jsonDecode(userJson));
    }
  }
}
