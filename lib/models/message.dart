import 'package:flutter/cupertino.dart';

enum MessageType { text, image, voice, video }
enum MessageStatus { viewed, notViewed, notSent }

class MessageModel {
  String message;
  MessageType messageType;
  MessageStatus messageStatus;
  bool isSender;

  MessageModel({@required this.message,
    @required this.messageType,
    @required this.messageStatus,
    @required this.isSender});

  List demoMessage = [
    MessageModel(message: "hello yousef",
        messageType: MessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false),
    MessageModel(message: "hello Dr shady",
        messageType: MessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true),
    MessageModel(message: "",
        messageType: MessageType.voice,
        messageStatus: MessageStatus.viewed,
        isSender: false),
    MessageModel(message: "Good voice",
        messageType: MessageType.text,
        messageStatus: MessageStatus.notViewed,
        isSender: true),
  ];

}
