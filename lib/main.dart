
import 'package:chat_app_firebase/Auth/providers/auth_provider.dart';
import 'package:chat_app_firebase/Auth/ui/login_page.dart';
import 'package:chat_app_firebase/Auth/ui/register_page.dart';
import 'package:chat_app_firebase/Auth/ui/reset_password_page.dart';
import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:chat_app_firebase/ui/chat_page.dart';
import 'package:chat_app_firebase/ui/home_page.dart';
import 'package:chat_app_firebase/ui/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Auth/ui/test.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        routes: {
          WelComePage.routeName:(context)=>WelComePage(),
          FirebaseConfiguration.routeName:(context)=>FirebaseConfiguration(),
          RegisterPage.routeName: (context) => RegisterPage(),
          LoginPage.routeName: (context) => LoginPage(),
          HomePage.routeName: (context) => HomePage(),
          ResetPasswordPage.routeName: (context) => ResetPasswordPage(),
          ChatPage.routeName:(context)=>ChatPage(),
        },
        navigatorKey: RoutHelper.routHelper.navKey,
        home:FirebaseConfiguration(),
      )));
}

class FirebaseConfiguration extends StatelessWidget {
  static final routeName='FirebaseConfiguration';

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, AsyncSnapshot<FirebaseApp> data) {
          if (data.hasError) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Text(data.error.toString()),
              ),
            );
          }
          if (data.connectionState == ConnectionState.done) {
            if (Provider.of<AuthProvider>(context,listen: false).getCurrentUser() != null) {
              return HomePage();
            }
            else {
              return RegisterPage();
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
