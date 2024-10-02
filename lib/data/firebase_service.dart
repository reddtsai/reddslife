import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chats_collection_model.dart';
import '../models/messages_collection_model.dart';

class FirebaseService {
  FirebaseFirestore firestore;

  FirebaseService(this.firestore);

  Stream<QuerySnapshot> getChats() {
    var ref = firestore
        .collection(ChatsCollectionModel.collectionName)
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
