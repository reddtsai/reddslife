import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/chats_controller.dart';
import '../models/chats_collection_model.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: controller.chats,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child:
                      Text(AppLocalizations.of(context)!.chatsViewCenterText),
                );
              }
              List chats = snapshot.data?.docs ?? [];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  ChatsCollectionModel chat = chats[index].data();
                  return Column(
                    children: [
                      ListTile(
                        title: Text(chat.name),
                        onTap: () {
                          Get.toNamed(
                              '/chat/${Uri.encodeComponent(chat.id)}/${Uri.encodeComponent(chat.name)}');
                        },
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
