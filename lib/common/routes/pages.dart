import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurakani/pages/auth/login/index.dart';
import 'package:kurakani/pages/auth/signup/index.dart';
import 'package:kurakani/pages/auth/welcome/index.dart';
import 'package:kurakani/pages/calls/index.dart';
import 'package:kurakani/pages/home/index.dart';
import 'package:kurakani/pages/notification/index.dart';
import '../../pages/chat/index.dart';
import '../../pages/contact/index.dart';
import '../../pages/profile/index.dart';
import '../middlewares/router_auth.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    /*

    // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    // 最新路由
    GetPage(name: AppRoutes.EmailLogin, page: () => EmailLoginPage(), binding: EmailLoginBinding()),
    GetPage(name: AppRoutes.Forgot, page: () => ForgotPage(), binding: ForgotBinding()),
    GetPage(name: AppRoutes.Phone, page: () => PhonePage(), binding: PhoneBinding()),
    GetPage(name: AppRoutes.SendCode, page: () => SendCodePage(), binding: SendCodeBinding()),
    // 首页

     */

    GetPage(
      name: AppRoutes.Register,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.Contact,
      page: () => const ContactPage(),
      binding: ContactBinding(),
    ),

    GetPage(
      name: AppRoutes.Notification,
      page: () => const IncomingCallNotification(),
      binding: NotificationBinding(),
    ),
    //消息

    GetPage(
      name: AppRoutes.Message,
      page: () => HomePage(),
      binding: HomeBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    GetPage(
      name: AppRoutes.Chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),

    GetPage(
      name: AppRoutes.VoiceCall,
      page: () => AudioCallPage(),
      binding: CallsBinding(),
    ),

    GetPage(
      name: AppRoutes.VideoCall,
      page: () => VideoCallPage(),
      binding: CallsBinding(),
    ),

    //我的
    GetPage(
      name: AppRoutes.Profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    //聊天详情
    /*

    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),
    GetPage(name: AppRoutes.VoiceCall, page: () => VoiceCallViewPage(), binding: VoiceCallViewBinding()),
    GetPage(name: AppRoutes.VideoCall, page: () => VideoCallPage(), binding: VideoCallBinding()),


     */
  ];
}
