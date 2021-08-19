import 'package:flutter/cupertino.dart';

class ChatModel {
  String name;
  String lastMessage;
  String image;
  bool isActive;
  String time;

  ChatModel(
      {@required this.name,
      @required this.lastMessage,
      @required this.image,
      @required this.isActive,
      @required this.time});

  List chats = [
    ChatModel(
        name: 'Yousef Mahmoud',
        lastMessage: 'I hope you are ok!',
        image: 'assets/images/im1.jpg',
        isActive: false,
        time: '1m ago'),
    ChatModel(
        name: 'Dr.Shady Samara',
        lastMessage: 'The best on gaza sky Geeks',
        image: 'assets/images/im2.jpg',
        isActive: true,
        time: 'online'),
    ChatModel(
        name: 'Fathi',
        lastMessage: 'I love the sea',
        image: 'assets/images/im3.jpg',
        isActive: false,
        time: '30m ago')
  ];
}
