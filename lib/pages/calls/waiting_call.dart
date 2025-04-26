import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/entities/contact.dart';
import 'package:kurakani/common/values/server.dart';

Widget callWaitingWidget(ContactItem? user, BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: 100,
        left: 0,
        right: 0,
        child: Column(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: user?.avatar == null
                    ? ""
                    : user!.avatar!.contains("http")
                        ? user.avatar!
                        : "$IMAGE_URL${user.avatar}",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user?.name ?? "",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "calling...",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 40,
        left: 0,
        right: 0,
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.call_end_outlined,
              size: 36,
              color: Colors.red,
            ),
          ),
        ),
      )
    ],
  );
}
