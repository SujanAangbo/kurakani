import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/apis/apis.dart';
import 'package:kurakani/common/entities/chatroom_model.dart';
import 'package:kurakani/common/entities/contact.dart';
import 'package:kurakani/common/entities/entities.dart';
import 'package:kurakani/common/routes/names.dart';
import 'package:kurakani/common/store/store.dart';
import 'package:kurakani/common/values/values.dart';
import 'package:kurakani/pages/contact/index.dart';
import 'package:uuid/uuid.dart';

class ContactController extends GetxController {
  ContactState state;

  ContactController({required this.state});

  final _database = FirebaseFirestore.instance;
  final _localStorage = UserStore.to;

  @override
  void onReady() {
    print('inside contact controller');
    super.onReady();
    _fetchAllContacts();
  }

  getChatroom(ContactItem contact) async {
    // write login to get chatroom if not exists then create
    String myToken = _localStorage.profile.token ?? "";

    try {
      final res = await _database
          .collection(CHATROOM)
          .where("participants", arrayContains: myToken)
          .get();

      // getting all the chatrooms of mine
      List<ChatRoomModel> chatrooms = res.docs
          .map(
            (doc) => ChatRoomModel.fromJson(doc.data()),
          )
          .toList();

      // filtering the chatrooms with friend
      List<ChatRoomModel?> filteredChatroom = chatrooms.map((chatroom) {
        if (chatroom.participants.contains(contact.token)) {
          return chatroom;
        } else {
          return null;
        }
      }).toList();
      filteredChatroom
          .removeWhere((chatroom) => chatroom == null); // filtering null

      ChatRoomModel chatRoom;

      if (filteredChatroom.isEmpty) {
        log('Chatroom doesnot exist');
        chatRoom = await _createChatRoom(myToken, contact.token ?? "");
      } else {
        // filter chatroom;
        log('Chatroom exists. Filtering the correct one');
        chatRoom = filteredChatroom.first!;
      }

      log('final result: ${chatRoom} => ${contact}');

      navigateToChatPage(chatRoom, contact);
    } catch (e) {
      // handle error
    }
  }

  Future<ChatRoomModel> _createChatRoom(
      String myToken, String friendToken) async {
    print("Creating chatroom");

    try {
      ChatRoomModel newChatroom = ChatRoomModel(
        id: const Uuid().v1(),
        lastMessage: "",
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        lastMessageSender: "",
        isSeen: false,
        isCommunicated: false,
        noOfUnseenMessages: 0,
        participants: [friendToken, myToken],
        initiated: '',
      );

      await _database
          .collection(CHATROOM)
          .doc(newChatroom.id)
          .set(newChatroom.toJson());

      print('Created successfully');
      return newChatroom;
    } catch (e) {
      rethrow;
    }
  }

  navigateToChatPage(ChatRoomModel chatroom, ContactItem user) {
    Get.offAndToNamed(AppRoutes.Chat, arguments: {
      "chatroom": chatroom,
      "user": user,
    });
  }

  _fetchAllContacts() async {
    state.isLoading.value = true;

    try {
      final result = await ContactAPI.post_contact();
      result.data
          ?.removeWhere((contact) => contact.token == _localStorage.token);
      log("contacts: ${result.data}");
      state.contacts.addAll(result.data ?? []);
    } catch (e) {
      // catch error
    }
    Timer(const Duration(milliseconds: 500), () {
      print('closing');
      state.isLoading.value = false;
    });
  }
}
