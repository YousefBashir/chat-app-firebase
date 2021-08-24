import 'package:chat_app_firebase/global_widgets/chat_card.dart';
import 'package:chat_app_firebase/global_widgets/filled_out_line_button.dart';
import 'package:chat_app_firebase/models/chat.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static final routeName = 'chat';
  ChatModel chatModel;
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
        time: '30m ago'),
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
        time: '30m ago'),
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
        time: '30m ago'),
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
        time: '30m ago'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat',
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                FilledOutLineButton(
                  btnText: 'Recent Message',
                  press: () {},
                  isFilled: true,
                ),
                SizedBox(
                  width: 10,
                ),
                FilledOutLineButton(
                  btnText: 'Active',
                  press: () {},
                  isFilled: false,
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (ctx, index) {
                    return ChatCard(chatModel:chats[index],);
                  }))
        ],
      ),
    );
  }
}
