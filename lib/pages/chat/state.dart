import '../../common/entities/chatroom_model.dart';
import '../../common/entities/contact.dart';

class ChatState {
  ChatRoomModel chatroom;
  ContactItem user;

  ChatState({
    required this.chatroom,
    required this.user,
  });
}
