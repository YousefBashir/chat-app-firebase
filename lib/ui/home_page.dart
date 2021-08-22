import 'package:chat_app_firebase/Auth/helpers/auth_helper.dart';
import 'package:chat_app_firebase/Auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final routeName='home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false)
        .getAllUsersFromFirestore();
    super.initState();
  }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              itemCount: Provider.of<AuthProvider>(context).allUsers.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    Provider.of<AuthProvider>(context).allUsers[index].fName,
                    style: TextStyle(color: Colors.white, fontSize:30,fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),


          ],
        ),
      )
    );
  }
}
