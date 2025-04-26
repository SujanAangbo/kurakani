import 'package:get/get.dart';
import 'package:kurakani/common/entities/chatroom_model.dart';

import '../../common/entities/contact.dart';

class CallState {
  ChatRoomModel chatroom;
  String document;
  RxBool isJoined = false.obs;
  bool isVideo;
  ContactItem? user;

  CallState({
    required this.chatroom,
    required this.document,
    this.isVideo = false,
    this.user,
  });
}
