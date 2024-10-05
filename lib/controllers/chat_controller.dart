import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firebase_service.dart';
import '../models/messages_collection_model.dart';

class ChatController extends GetxController {
  String userID;

  late String title;
  late String chatID;
  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  late FocusNode focusNode;
  late TextEditingController textController;
  late ScrollController scrollController;
  final FirebaseService firebaseService;
  late Stream<QuerySnapshot> messages;

  ChatController(this.firebaseService, this.userID);

  Future<void> sendMessage() async {
    _loading.value = true;
    if (textController.text.isNotEmpty) {
      firebaseService.sendMessage(
        chatID,
        MessagesCollectionModel(
          message: textController.text,
          fromID: userID,
          date: Timestamp.now(),
        ),
      );

      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      textController.clear();
    }

    _loading.value = false;
  }

  @override
  void onInit() {
    focusNode = FocusNode();
    textController = TextEditingController();
    scrollController = ScrollController();
    title = Get.parameters['name'] ?? 'NONE';
    chatID = Get.parameters['id']!;
    messages = firebaseService.getMessages(chatID);

    super.onInit();
  }

  @override
  void onClose() {
    focusNode.dispose();
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
