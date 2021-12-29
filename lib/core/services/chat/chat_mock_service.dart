import 'dart:async';
import 'dart:math';

import 'package:chat_firestore/core/models/chat_message.dart';
import 'package:chat_firestore/core/models/chat_user.dart';
import 'package:chat_firestore/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    //mock para gerar as msgs de teste
    // ChatMessage(
    //   id: '1',
    //   text: 'Daily Meeting',
    //   createdAt: DateTime.now(),
    //   userId: '145',
    //   userName: 'AdminChat',
    //   userImageURL: 'assets/images/avatar.png',
    // ),
    // ChatMessage(
    //   id: '2',
    //   text: 'Daily Meeting confirmed?How many people?',
    //   createdAt: DateTime.now(),
    //   userId: '251',
    //   userName: 'Anna',
    //   userImageURL: 'assets/images/avatar.png',
    // ),
    // ChatMessage(
    //   id: '3',
    //   text:
    //       'The entire team, we have to discuss deadlines with the client, align goals.',
    //   createdAt: DateTime.now(),
    //   userId: '145',
    //   userName: 'AdminChat',
    //   userImageURL: 'assets/images/avatar.png',
    // ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
        id: Random().nextDouble().toString(),
        text: text,
        createdAt: DateTime.now(),
        userId: user.id,
        userName: user.name,
        userImageURL: user.imageURL);
    _msgs.add(newMessage);
    /*//se as msg estiverem alterando a orden e aparecendo de baixo para cima 
    neste ponto add o seguinte código:
    _controller?.add(_msgs.reversed.toList());
     */
    _controller?.add(_msgs);
    return newMessage;
  }
}
