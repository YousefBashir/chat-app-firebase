import 'package:chat_app_firebase/Auth/helpers/auth_helper.dart';
import 'package:chat_app_firebase/Auth/providers/auth_provider.dart';
import 'package:chat_app_firebase/ui/profile.dart';
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
    return DefaultTabController(
      length: 1,
      child: Scaffold(
       body: TabBarView(children: [
         
         ProfilePage(),
       ],),
      ),
    );
  }
}
