import 'package:get/get.dart';

class ChatController extends GetxController {
  final RxList<String> _message = <String>[].obs;
  get message => _message;

  @override
  void onInit() {
    message.addAll(['1', '2', '3']);
    super.onInit();
  }
}
