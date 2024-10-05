import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../models/chats_collection_model.dart';
import '../models/messages_collection_model.dart';

class FirebaseService {
  FirebaseFirestore firestore;
  FirebaseMessaging firemessage;
  String userID;

  FirebaseService(this.firestore, this.firemessage, this.userID) {
    firestore.settings = const Settings(persistenceEnabled: true);
    firemessage.setAutoInitEnabled(true);
    firemessage.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  // TODO: Implement the subscribeHandler method
  void subscribeHandler() {
    // preload all chats
    // save all chats in local storage
    firestore
        .collection(ChatsCollectionModel.collectionName)
        .where('participants', arrayContains: userID)
        .snapshots()
        .listen((data) {
      for (var doc in data.docs) {
        firestore
            .collection(ChatsCollectionModel.collectionName)
            .doc(doc.id)
            .collection(MessagesCollectionModel.collectionName)
            .snapshots()
            .listen((data) {});
      }
    });
  }

  Stream<QuerySnapshot> getChats() {
    var ref = firestore
        .collection(ChatsCollectionModel.collectionName)
        .where('participants', arrayContains: userID)
        .withConverter<ChatsCollectionModel>(
          fromFirestore: (snapshot, _) =>
              ChatsCollectionModel.fromJson(snapshot.id, snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
    return ref.snapshots();
  }

  CollectionReference messagesRef(String chatID) {
    var ref = firestore
        .collection(ChatsCollectionModel.collectionName)
        .doc(chatID)
        .collection(MessagesCollectionModel.collectionName)
        .withConverter<MessagesCollectionModel>(
          fromFirestore: (snapshot, _) =>
              MessagesCollectionModel.fromJson(snapshot.id, snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
    return ref;
  }

  Stream<QuerySnapshot> getMessages(String chatID) {
    var ref = messagesRef(chatID);
    return ref.orderBy('date', descending: true).snapshots();
  }

  void sendMessage(String chatID, MessagesCollectionModel message) {
    var ref = messagesRef(chatID);
    ref.add(message);
  }
}
