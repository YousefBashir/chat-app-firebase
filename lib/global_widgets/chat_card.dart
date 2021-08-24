import 'package:chat_app_firebase/models/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chatModel;

  ChatCard({this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(chatModel.image),
                radius: 24,
              ),
              if (chatModel.isActive)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white)),
                  ),
                )
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 5,
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatModel.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Opacity(
                      opacity: 0.64,
                      child: Text(
                        chatModel.lastMessage,
                        maxLines: 1,
                      )),
                ],
              ),
            ),
          ),
          Opacity(opacity: 0.64, child: Text(chatModel.time)),
        ],
      ),
    );
  }
}
