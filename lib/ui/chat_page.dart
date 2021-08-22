import 'package:chat_app_firebase/global_widgets/filled_out_line_button.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static final routeName='chat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Chat',),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search) ),
        ],
      ),
      body:Column(
      children: [
        Container(
          color: Colors.blue,
          padding: EdgeInsets.all(10),
          child:Row(
            children: [
              FilledOutLineButton(btnText: 'Recent Message',press: (){},isFilled: true,),
              SizedBox(width: 10,),
              FilledOutLineButton(btnText: 'Active',press: (){},isFilled: false,),
            ],
          ),
        )
      ],
      ),
    );
  }
}
