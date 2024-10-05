import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../models/messages_collection_model.dart';

class ChatPageBinding extends Bindings {
  String userID;

  ChatPageBinding(this.userID);

  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController(Get.find(), userID));
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
                              return Container(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Align(
                                  alignment: message.fromID == controller.userID
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          (message.fromID == controller.userID
                                              ? Colors.blue
                                              : Colors.grey),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          message.message,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(message.formattedDate,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
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
