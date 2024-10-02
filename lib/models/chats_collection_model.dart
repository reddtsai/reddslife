class ChatsCollectionModel {
  static const String collectionName = 'chats';
  final String id;
  final String name;

  ChatsCollectionModel({
    required this.id,
    required this.name,
  });

  factory ChatsCollectionModel.fromJson(String id, Map<String, dynamic> json) {
    return ChatsCollectionModel(
      id: id,
      name: json['name']! as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
