import 'package:get/get.dart';
import 'package:kurakani/pages/chat/index.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;
    print(args);
    print(args['chatroom']);
    Get.put<ChatState>(
      ChatState(
        chatroom: args['chatroom'],
        user: args['user'],
      ),
    );
    Get.put<ChatController>(
      ChatController(
        state: Get.find<ChatState>(),
      ),
    );
  }
}
