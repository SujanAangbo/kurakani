import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurakani/pages/calls/controller.dart';
import 'package:kurakani/pages/calls/waiting_call.dart';
import 'package:uuid/uuid.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallPage extends GetView<CallController> {
  const AudioCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.state.isJoined.value
          ? Scaffold(
              body: ZegoUIKitPrebuiltCall(
                appID: int.parse(controller.appId),
                appSign: controller.appSign,
                userID: controller.user.token ?? const Uuid().v4(),
                userName: controller.user.name ?? "Unknown",
                callID: controller.state.document,
                config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
                onDispose: () async {
                  // Let the controller decide whether this user should create the call record
                  final isCreator = await controller.isUserCallCreator();
                  controller.callDispose(false, isCreator: isCreator);
                },
              ),
              // body: Center(child: Text("Audio Call"),),
            )
          : callWaitingWidget(controller.state.user, context),
    );
  }
}
