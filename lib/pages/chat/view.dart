import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/entities/message_model.dart';
import 'package:kurakani/common/values/values.dart';
import 'package:kurakani/pages/chat/controller.dart';
import 'package:kurakani/pages/chat/widgets/chat_card.dart';

class ChatPage extends GetView<ChatController> {
  ChatPage({super.key});

  final TextEditingController messageController = TextEditingController();

  sendMessage() {
    String message = messageController.text.trim();
    if (message.isEmpty) return;

    controller.sendMessage(message);
    messageController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    void scrollToEnd() {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: StreamBuilder(
                stream: controller.listenToMessages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryElement,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final messages = snapshot.data as List<MessageModel>;
                    if (messages.isEmpty) {
                      return Center(
                        child: Text(
                          "No chat yet!\nMessage to start chatting...",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    }

                    messages.sort((a, b) => a.time.compareTo(b.time));
                    return _buildChatList(messages, _scrollController);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            width: 360.w,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    textAlignVertical: TextAlignVertical.top,
                    minLines: 1,
                    maxLines: 3,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      // suffixIcon: IconButton(
                      //   padding: EdgeInsets.zero,
                      //   icon: const Icon(Icons.image),
                      //   onPressed: () {},
                      // ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildChatList(
      List<MessageModel> messages, ScrollController scrollController) {
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        MessageModel message = messages[messages.length - index - 1];
        bool isMine = message.sender.compareTo(controller.user.token ?? "") == 0
            ? true
            : false;
        return ChatCard(isMine: isMine, message: message);
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 10,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          CachedNetworkImage(
            imageUrl: controller.state.user.avatar == null
                ? ""
                : controller.state.user.avatar!.contains("http")
                    ? controller.state.user.avatar!
                    : "$IMAGE_URL${controller.state.user.avatar}",
            height: 36,
            width: 36,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.state.user.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  controller.state.user.online == 0 ? "offline" : "online",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: controller.state.user.online == 0
                            ? AppColors.primaryThreeElementText
                            : AppColors.primaryElementStatus,
                      ),
                )
              ],
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.phone_outlined),
          onPressed: controller.initiateVoiceCall,
        ),
        IconButton(
          icon: const Icon(Icons.videocam_outlined),
          onPressed: controller.initiateVideoCall,
        ),
      ],
    );
  }
}
