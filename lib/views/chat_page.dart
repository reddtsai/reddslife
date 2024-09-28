import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';

class ChatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}

class ChatPage extends GetView<ChatController> {
  ChatPage({super.key});

  final String title = Get.parameters['title'] ?? 'Chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.message.length,
                  itemBuilder: (context, index) {
                    final message = controller.message[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(message),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
