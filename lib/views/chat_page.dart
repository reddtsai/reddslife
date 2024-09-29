import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
            child: GestureDetector(
              onTap: () {
                controller.focusNode.unfocus();
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Obx(() => ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: controller.message.length,
                      itemBuilder: (context, index) {
                        final message = controller.message[index];
                        return message.type == ChatMessageType.sent
                            ? getSenderView(context, message)
                            : getReceiverView(context, message);
                      },
                    )),
              ),
            ),
          ),
          SafeArea(
            bottom: true,
            child: Container(
              constraints: const BoxConstraints(minHeight: 48),
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  TextField(
                    controller: controller.textController,
                    focusNode: controller.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(left: 16, right: 56),
                      hintText: 'message',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (txt) {
                      controller.onInputChanged(txt);
                    },
                  ),
                  Positioned(
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          controller.sendMessage();
                        },
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  getSenderView(BuildContext context, ChatMessageModel data) => ChatBubble(
        clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            children: [
              Text(
                data.message,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(formatDateTime(data.createdAt),
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      );

  getReceiverView(BuildContext context, ChatMessageModel data) => ChatBubble(
        clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
        backGroundColor: const Color(0xffE7E7ED),
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            children: [
              Text(
                data.message,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(formatDateTime(data.createdAt),
                  style: const TextStyle(color: Colors.black, fontSize: 12)),
            ],
          ),
        ),
      );

  static String formatDateTime(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat('hh:mm a');
    return dateFormat.format(dateTime);
  }
}
