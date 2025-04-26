import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/entities/chatroom_model.dart';
import 'package:kurakani/common/routes/names.dart';
import 'package:kurakani/firebase_options.dart';
import 'package:kurakani/pages/notification/initialize_notification.dart';

import 'common/services/storage.dart';
import 'common/store/user.dart';
import 'common/values/server.dart';

class Global {
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    _showNotification(message);
  }

  static Future<void> _onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    String action = receivedAction.buttonKeyPressed;

    final database = FirebaseFirestore.instance;
    if (action.compareTo("reject") == 0) {
      database
          .collection(CALL)
          .doc(document)
          .update({"callStatus": "rejected"});
    } else if (action.compareTo("accept") == 0) {
      database
          .collection(CALL)
          .doc(document)
          .update({"callStatus": "accepted"});
    } else {
      // if taps on notification
      database
          .collection(CALL)
          .doc(document)
          .update({"callStatus": "foreground"});
    }
  }

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // local storage initialization
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());

    // firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // initialize notification
    InitializeNotification();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      // todo: write a logic to update fcm_token
      print("Updated FCM Token: $newToken");
    });

    try {
      var response = (await Dio().get('${SERVER_API_URL}api/gegoData')).data
          as Map<String, dynamic>;

      log("Response: ${response}");

      Get.put<String>(response['app_id'], tag: "app_id");
      Get.put<String>(response['app_sign'], tag: "app_sign");
    } catch (e) {
      log("This is the error: $e");
    }
  }

  static late String document;

  static _showNotification(RemoteMessage remoteMessage) async {
    // initialize document variable;
    print('notification data : ${remoteMessage.data}');
    document = remoteMessage.data['doc_id'];
    String callType = remoteMessage.data[
        'callType']; // it helps to determine the call type like video or voice call

    bool isCall =
        callType.compareTo("voice") == 0 || callType.compareTo("video") == 0;

    AwesomeNotifications awesomeNotifications = AwesomeNotifications();
    bool isGranted = await awesomeNotifications.isNotificationAllowed();
    if (!isGranted) {
      await awesomeNotifications.requestPermissionToSendNotifications();
    }

    // listen to callStatus changes
    final docStream = FirebaseFirestore.instance
        .collection(CALL)
        .doc(remoteMessage.data['doc_id'])
        .snapshots();
    docStream.listen((document) {
      final status = document.data()?["callStatus"].toString() ?? "";
      if (status.compareTo("calling") == 0) {
        // create notification
        awesomeNotifications.createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: "call",
            title: remoteMessage.notification?.title ?? "",
            body: remoteMessage.notification?.body ?? "",
            largeIcon: remoteMessage.data['image'],
            wakeUpScreen: true,
            fullScreenIntent: true,
          ),
          actionButtons: [
            NotificationActionButton(
              key: "accept",
              label: "Accept",
              color: Colors.green,
            ),
            NotificationActionButton(
              key: "reject",
              label: "Reject",
              color: Colors.red,
            ),
          ],
        );
      } else if (status.compareTo("accepted") == 0) {
        // if accepts go to call page
        final chatroom =
            ChatRoomModel.fromJson(jsonDecode(remoteMessage.data['chatroom']));

        Get.toNamed(
            callType.compareTo("voice") == 0
                ? AppRoutes.VoiceCall
                : AppRoutes.VideoCall,
            arguments: {
              "chatroom": chatroom,
              "document": remoteMessage.data['doc_id'],
              "isVideo": callType.compareTo("voice") == 0 ? false : true,
            });
      } else if (status.compareTo("rejected") == 0 ||
          status.compareTo("cancelled") == 0) {
        awesomeNotifications.cancelNotificationsByChannelKey("call");
      } else if (status.compareTo("foreground") == 0) {
        // todo: show calling notification page not push notification
        Get.toNamed(AppRoutes.Notification, arguments: {
          "message": remoteMessage,
        });
      }
    });

    awesomeNotifications.setListeners(
        onActionReceivedMethod: _onActionReceivedMethod);
  }
}
