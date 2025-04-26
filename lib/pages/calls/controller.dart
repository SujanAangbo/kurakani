import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/entities/chatroom_model.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/store/store.dart';
import 'package:kurakani/pages/calls/state.dart';
import 'package:uuid/uuid.dart';

import '../../common/entities/message_model.dart';
import '../../common/values/server.dart';

class CallController extends GetxController {
  late DateTime startTime;
  late DateTime endTime;

  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final CallState state;

  CallController({required this.state}) {
    initiate();

    // Timer(const Duration(seconds: 20), () {
    //   _database
    //       .collection(CALL)
    //       .doc(state.document)
    //       .update({"callStatus": "cancelled"});
    //   Get.back();
    // });

    startTime = DateTime.now();
  }

  UserItem user = UserStore.to.profile;

  String get appId => Get.find<String>(tag: "app_id");

  String get appSign => Get.find<String>(tag: "app_sign");

  initiate() async {
    String? initiated = await _getInitiatedValue();

    if (initiated == null || initiated.isEmpty) {
      _updateInitiatedValue(user.token ?? "");
    }

    // listen to call status changes
    final docStream =
        _database.collection(CALL).doc(state.document).snapshots();
    docStream.listen((document) {
      final status = document.data()?["callStatus"].toString() ?? "";
      if (status.compareTo("calling") == 0) {
        print('calling'); // do nothing
        state.isJoined.value = false;
      } else if (status.compareTo("rejected") == 0) {
        _database.collection(CALL).doc(state.document).delete();
        sendMessage("Missed Call", state.isVideo, user.token ?? "", startTime);
        Get.back();
      } else if (status.compareTo("cancelled") == 0) {
        _database.collection(CALL).doc(state.document).delete();
        sendMessage("Missed Call", state.isVideo, user.token ?? "", startTime);
      } else if (status.compareTo("accepted") == 0) {
        print('accepted');
        _database.collection(CALL).doc(state.document).delete();
        state.isJoined.value = true;
        // change ui
      }
    });
  }

  // Add a public method to check if current user is the creator
  Future<bool> isUserCallCreator() async {
    String? creatorId = await _getInitiatedValue();
    log("Creator ID: $creatorId");
    log("User token: ${user.token}");

    if (creatorId == null) {
      return false;
    }

    // If no creator is set, we'll designate the current user as creator
    if (creatorId.isEmpty) {
      log("No creator found, setting current user as creator");
      return true;
    }

    return user.token == creatorId;
  }

  // A method to determine which user should create the call message
  // This will be used as a fallback if creator determination fails
  Future<bool> shouldCreateCallMessage() async {
    try {
      // First try to use the creator detection
      bool isCreator = await isUserCallCreator();
      if (isCreator) return true;

      // If that doesn't work, use a fallback approach based on participants
      List<String> participants = state.chatroom.participants;
      if (participants.isEmpty || participants.length != 2) return true;

      // If there are exactly 2 participants, let the first one in the list create the message
      return participants[0] == user.token;
    } catch (e) {
      log("Error determining call message creator: $e");
      // In case of any error, default to true so at least one message gets created
      return true;
    }
  }

  void callDispose(bool isVideoCall, {bool isCreator = false}) async {
    // If isCreator is explicitly set to false, try to determine if this user should create the message
    // if (isCreator == false) {
    //   log("creator = false, checking if this user should create call message");
    //   isCreator = await shouldCreateCallMessage();
    // }

    if (isCreator == false) {
      log("This user should not create call message");
      return;
    }

    log("This user will create call message");

    endTime = DateTime.now();

    Duration diff = endTime.difference(startTime);
    String callTime = calculateCallTime(diff);
    log("calltime: $callTime");

    String? creatorId = await _getInitiatedValue();
    // If creatorId is empty, use the current user's token
    if (creatorId == null || creatorId.isEmpty) {
      creatorId = user.token ?? "";
    }

    sendMessage(callTime, isVideoCall, creatorId, startTime);

    log('cancelling call');
    _database
        .collection(CALL)
        .doc(state.document)
        .update({"callStatus": "cancelled"});

    // remove initiated value
    _updateInitiatedValue("");
  }

  void sendMessage(String callTime, bool isVideoCall, String creator,
      DateTime startTime) async {
    MessageModel newMessage = MessageModel(
      id: const Uuid().v4(),
      isMessage: false,
      message: "",
      imageUrl: "",
      seen: false,
      callDuration: callTime,
      isVideo: isVideoCall,
      time: startTime.toIso8601String(),
      sender: creator,
    );

    try {
      await _database
          .collection(CHATROOM)
          .doc(state.chatroom.id)
          .collection(MESSAGE)
          .doc(newMessage.id)
          .set(newMessage.toJson());
      log("Message sent");
    } catch (e) {
      log("Error sending message: $e");
    }
  }

  Future<String?> _getInitiatedValue() async {
    try {
      final res =
          await _database.collection(CHATROOM).doc(state.chatroom.id).get();
      ChatRoomModel chatroom = ChatRoomModel.fromJson(res.data() ?? {});
      return chatroom.initiated;
    } catch (e) {
      log("Error getting initiated value: $e");
      return null;
    }
  }

  void _updateInitiatedValue(String value) {
    try {
      _database
          .collection(CHATROOM)
          .doc(state.chatroom.id)
          .update({"initiated": value});
    } catch (e) {
      log("Error updating initiated value: $e");
    }
  }

  String calculateCallTime(Duration duration) {
    int hour = duration.inHours;
    int minute = duration.inMinutes;
    int second = duration.inSeconds;

    if (hour == 0 && minute == 0) {
      return "$second sec";
    } else if (hour == 0) {
      return "$minute min ${second % 60} sec";
    } else {
      return "$hour hours ${minute % 60} min";
    }
  }

  @override
  void onClose() {
    print('call disposing');
    _database
        .collection(CALL)
        .doc(state.document)
        .update({"callStatus": "cancelled"});
    print('call updated');
    super.onClose();
  }
}
