import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MessagesCollectionModel {
  static const String collectionName = 'messages';
  final String message;
  final String fromID;
  final Timestamp date;

  MessagesCollectionModel({
    required this.message,
    required this.fromID,
    required this.date,
  });

  factory MessagesCollectionModel.fromJson(
      String id, Map<String, dynamic> json) {
    return MessagesCollectionModel(
      message: json['message']! as String,
      fromID: json['from_id']! as String,
      date: json['date']! as Timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'from_id': fromID,
      'date': date,
    };
  }

  MessagesCollectionModel copyWith({
    String? message,
    String? fromID,
    Timestamp? date,
  }) {
    return MessagesCollectionModel(
      message: message ?? this.message,
      fromID: fromID ?? this.fromID,
      date: date ?? this.date,
    );
  }

  String get formattedDate {
    return DateFormat.jm().format(date.toDate());
  }
}
