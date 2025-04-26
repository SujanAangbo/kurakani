import 'package:get/get.dart';
import 'package:kurakani/pages/calls/index.dart';

class CallsBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;
    print("arguments: ${args}");
    // print(args['chatroom']);
    Get.lazyPut<CallState>(
      () => CallState(
        chatroom: args['chatroom'],
        document: args['document'],
        isVideo: args['isVideo'],
        user: args['user'],
      ),
    );
    Get.lazyPut<CallController>(
      () => CallController(
        state: Get.find(),
      ),
    );
  }
}
