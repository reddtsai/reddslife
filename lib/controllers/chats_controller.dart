import 'package:get/get.dart';

class ChatsController extends GetxController {
  final RxList<String> _chats = <String>[].obs;
  get chat => _chats;

  @override
  void onInit() {
    // TODO: implement read chats
    super.onInit();
  }
}
