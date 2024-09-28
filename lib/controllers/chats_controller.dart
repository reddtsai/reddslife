import 'package:get/get.dart';

class ChatsController extends GetxController {
  final RxList<String> _chats = <String>[].obs;
  get chat => _chats;

  @override
  void onInit() {
    _chats.addAll(['Chat 1', 'Chat 2', 'Chat 3']);
    super.onInit();
  }
}
