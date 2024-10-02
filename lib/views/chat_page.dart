import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/chat_controller.dart';
import '../models/messages_collection_model.dart';

class ChatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController(Get.find()));
  }
}

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      controller.focusNode.unfocus();
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: StreamBuilder(
                        stream: controller.messages,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Icon(Icons.chat_bubble_outline),
                            );
                          }
                          List messages = snapshot.data?.docs ?? [];
                          return ListView.builder(
                            controller: controller.scrollController,
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              MessagesCollectionModel message =
                                  messages[index].data();
                              return message.fromID == controller.userID
                                  ? getSenderView(context, message)
                                  : getReceiverView(context, message);
                            },
                          );
                        },
                      ),
                    ))),
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // autofocus: true,
                          controller: controller.textController,
                          focusNode: controller.focusNode,
                          decoration: txtFieldDecoration(context),
                        ),
                      ),
                      const SizedBox(width: 15),
                      if (controller.loading)
                        const CircularProgressIndicator()
                      else
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () async {
                            controller.sendMessage();
                          },
                        ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  getSenderView(BuildContext context, MessagesCollectionModel data) =>
      ChatBubble(
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
              Text(data.formattedDate,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      );

  getReceiverView(BuildContext context, MessagesCollectionModel data) =>
      ChatBubble(
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
              Text(data.formattedDate,
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

InputDecoration txtFieldDecoration(BuildContext context) => InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
