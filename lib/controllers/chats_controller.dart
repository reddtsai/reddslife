import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/firebase_service.dart';

class ChatsController extends GetxController {
  final FirebaseService firebaseService;
  late Stream<QuerySnapshot> chats;

  ChatsController(this.firebaseService);

  @override
  void onInit() {
    chats = firebaseService.getChats();
    super.onInit();
  }
}
