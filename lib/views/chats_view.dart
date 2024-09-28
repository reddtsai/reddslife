import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.chat.length,
                  itemBuilder: (context, index) {
                    final chat = controller.chat[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(chat),
                          onTap: () {
                            Get.toNamed('/chat/${Uri.encodeComponent(chat)}');
                          },
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ))),
      ],
    );
  }
}
