import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/apis/notification.dart';
import 'package:kurakani/common/entities/call_model.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/entities/message_model.dart';
import 'package:kurakani/common/values/server.dart';
import 'package:kurakani/pages/chat/index.dart';
import 'package:uuid/uuid.dart';
import '../../common/routes/names.dart';
import '../../common/store/user.dart';

class ChatController extends GetxController {
  ChatState state;

  ChatController({
    required this.state,
  });

  final FirebaseFirestore _database = FirebaseFirestore.instance;
  UserItem user = UserStore.to.profile;

  void sendMessage(String message) async {
    MessageModel newMessage = MessageModel(
      id: const Uuid().v4(),
      isMessage: true,
      message: message,
      imageUrl: "",
      seen: false,
      callDuration: "",
      isVideo: false,
      time: DateTime.now().toIso8601String(),
      sender: user.token ?? "",
    );

    try {
      await _database
          .collection(CHATROOM)
          .doc(state.chatroom.id)
          .collection(MESSAGE)
          .doc(newMessage.id)
          .set(newMessage.toJson());
      log("Message sent");

      // update chatroom
      state.chatroom = state.chatroom.copyWith(
        lastMessage: newMessage.message,
        updatedAt: DateTime.now().toIso8601String(),
        lastMessageSender: user.token,
        isCommunicated: true,
      );
      _database
          .collection(CHATROOM)
          .doc(state.chatroom.id)
          .update(state.chatroom.toJson());
    } catch (e) {
      // handle error
    }
  }

  listenToMessages() {
    final stream = _database
        .collection(CHATROOM)
        .doc(state.chatroom.id)
        .collection(MESSAGE)
        .orderBy("time", descending: true)
        .snapshots()
        .map((event) => event.docs
            .map(
              (doc) => MessageModel.fromJson(doc.data()),
            )
            .toList());

    return stream;

    //(event) => event.docs.sort(
    //             (a, b) => (a.data()["time"] as String).compareTo(
    //               b.data()['time'],
    //             ),
    //           )
  }

  sendNotification(bool isVideo) {
    CallModel newCall = CallModel(
      id: const Uuid().v1(),
      callId: const Uuid().v4(),
      callStatus: "calling",
    );
    _database.collection(CALL).doc(newCall.id).set(newCall.toJson());

    final data = {
      "fcm_token": state.user.fcm_token,
      "notification": {
        "title": user.name,
        "body": isVideo ? "🎥 Incoming voice call" : "📞 Incoming voice call"
      },
      "data": {
        "doc_id": newCall.id,
        "image": user.avatar,
        "chatroom": jsonEncode(
          state.chatroom.toJson(),
        ),
        "callType": isVideo ? "video" : "voice",
      },
    };

    NotificationApi().sendNotification(data);
    return newCall.id;
  }

  void initiateVoiceCall() {
    String id = sendNotification(false);
    Get.toNamed(
      AppRoutes.VoiceCall,
      arguments: {
        "chatroom": state.chatroom,
        "document": id,
        "isVideo": false,
        "user": state.user,
      },
    );
  }

  void initiateVideoCall() {
    String id = sendNotification(true);
    Get.toNamed(
      AppRoutes.VideoCall,
      arguments: {
        "chatroom": state.chatroom,
        "document": id,
        "isVideo": true,
        "user": state.user,
      },
    );
  }
}
