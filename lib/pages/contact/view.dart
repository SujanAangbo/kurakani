import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurakani/common/values/server.dart';
import 'package:kurakani/pages/contact/controller.dart';
import 'package:kurakani/pages/contact/widgets/contact_shimmer.dart';
import '../../common/entities/contact.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  Widget _buildContactListTile(ContactItem contact) {
    return ListTile(
      onTap: () {
        controller.getChatroom(contact);
      },
      leading: ClipOval(
        child: CachedNetworkImage(
          imageUrl: contact.avatar == null
              ? ""
              : contact.avatar!.contains("http")
                  ? contact.avatar!
                  : "$IMAGE_URL${contact.avatar}",
          fit: BoxFit.cover,
          height: 40,
          width: 40,
        ),
      ),
      title: Text(contact.name ?? ""),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if(controller.state.isLoading.value) {
            return const ContactShimmer();
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.state.contacts.length,
              itemBuilder: (context, index) {
                ContactItem contact = controller.state.contacts[index];

                return _buildContactListTile(contact);
              },
            );
          }
        },
      ),
    );
  }
}
