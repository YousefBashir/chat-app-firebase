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
}
