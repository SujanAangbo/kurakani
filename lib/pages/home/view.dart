import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/routes/names.dart';
import 'package:kurakani/common/services/formatter.dart';
import 'package:kurakani/common/values/colors.dart';
import 'package:kurakani/common/values/server.dart';
import 'package:kurakani/pages/home/controller.dart';
import 'package:kurakani/pages/home/widgets/chat_tile_shimmer.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildUserProfile({required VoidCallback onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Obx(() {
            final user = controller.state.user.value;
            return CircleAvatar(
              backgroundImage: NetworkImage(user != null && user.avatar != null
                  ? user.avatar!.contains("http")
                      ? user.avatar!
                      : "$IMAGE_URL${user.avatar}"
                  : ""),
              radius: 16,
            );
          }),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: AppColors.primaryElementStatus,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "KuraKani",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.primaryElement,
                  ),
            ),
            _buildUserProfile(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => ListView.separated(
            itemCount: controller.state.chatrooms.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final chatroom = controller.state.chatrooms[index];

              return FutureBuilder(
                future: controller.getUserDetails(chatroom.participants),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ChatTileShimmer();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    return ListTile(
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () {
                        Get.toNamed(AppRoutes.Chat, arguments: {
                          "chatroom": chatroom,
                          "user": data!,
                        });
                      },
                      leading: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: data?.avatar == null
                              ? ""
                              : data!.avatar!.contains("http")
                                  ? data.avatar!
                                  : "$IMAGE_URL${data.avatar}",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // CachedNetworkImage(
                      //   backgroundImage: NetworkImage(),
                      // ),
                      title: Text(
                        data?.name ?? "",
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      subtitle: Text(
                        chatroom.lastMessage,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black.withOpacity(0.6),
                            ),
                      ),
                      trailing: Text(
                        Formatter.formatChatDate(chatroom.updatedAt),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 0,
              );
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Obx(() {
          final user = controller.state.user.value;
          print("user image: ${user?.avatar ?? ""}");

          if (user == null) {
            Get.offAllNamed(AppRoutes.SIGN_IN);
            return Container();
          }
          return Column(
            children: [
              const SizedBox(height: 60),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      user.avatar != null
                          ? user.avatar!.contains("http")
                              ? user.avatar!
                              : "$IMAGE_URL${user.avatar!}"
                          : "",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.name ?? "Unknown",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                width: 200.w,
                text: "Edit Profile",
                background: AppColors.primaryElement,
                onPressed: controller.navigateProfilePage,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                width: 200.w,
                text: "Logout",
                background: AppColors.primaryElementBg,
                onPressed: () {
                  Get.defaultDialog(
                    title: "Logout!",
                    content: const Text("Are you sure you want to logout?"),
                    onConfirm: () {
                      controller.logout();
                    },
                    confirmTextColor: Colors.red,
                    textConfirm: "Yes",
                    textCancel: "No",
                  );
                },
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.Contact);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: AppColors.primaryElement,
          child: Icon(Icons.person_add_alt)),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color background;
  final double? width;
  final VoidCallback onPressed;
  final Color textColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.background,
    required this.onPressed,
    this.textColor = Colors.white,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 360.w,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: background,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
