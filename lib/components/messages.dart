import 'package:chat_firestore/components/message_baloon.dart';
import 'package:chat_firestore/core/models/chat_message.dart';
import 'package:chat_firestore/core/services/auth/auth_service.dart';
import 'package:chat_firestore/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messagesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data history. Let\'s talk?'));
          } else {
            final msgs = snapshot.data!;
            return ListView.builder(
              itemCount: msgs.length,
              itemBuilder: (context, index) => MessageBaloon(
                key: ValueKey(msgs[index].id),
                message: msgs[index],
                belongsToCurrentUser: currentUser?.id == msgs[index].userId,
              ),
            );
          }
        });
  }
}
