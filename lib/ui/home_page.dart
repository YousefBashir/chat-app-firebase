import 'package:chat_app_firebase/Auth/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final routeName='home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
        backgroundColor: Colors.blue.shade900,

      ),
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade600,
                Colors.blue.shade400,
              ],
            )),
        child:  Center(
          child: Text("Welcome to home page"),
        ),
      )
    );
  }
}
