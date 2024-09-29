import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum ChatMessageType {
  sent,
  received,
}

class ChatMessageModel {
  final String id;
  final String message;
  final ChatMessageType type;
  final DateTime createdAt;
  ChatMessageModel({
    required this.id,
    required this.message,
    required this.type,
    required this.createdAt,
  });
}

class ChatController extends GetxController {
  final RxList<ChatMessageModel> _message = <ChatMessageModel>[].obs;
  List<ChatMessageModel> get message => _message;
  final RxString _inputText = ''.obs;
  String get inputText => _inputText.value;
  late FocusNode focusNode;
  late TextEditingController textController;
  late ScrollController scrollController;

  void onInputChanged(String text) {
    _inputText.value = text;
  }

  Future<void> sendMessage() async {
    if (inputText.isNotEmpty) {
      _message.insert(
        0,
        ChatMessageModel(
          id: DateTime.now().toString(),
          message: _inputText.value,
          type: ChatMessageType.sent,
          createdAt: DateTime.now(),
        ),
      );

      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _inputText.value = '';
      textController.clear();
    }
  }

  @override
  void onInit() {
    focusNode = FocusNode();
    textController = TextEditingController();
    scrollController = ScrollController();
    // TODO: implement read messages

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
