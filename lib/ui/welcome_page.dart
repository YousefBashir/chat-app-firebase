import 'package:chat_app_firebase/main.dart';
import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:flutter/material.dart';

class WelComePage extends StatelessWidget {
  static final routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2));
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            'assets/images/welcome_image.png',
          ),
          const Spacer(
            flex: 3,
          ),
          Text(
            'Welcome to our chater \nmessaging app',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          const Spacer(),
          Text(
            'Freedom talk to any person \naround the world',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.withOpacity(0.8)),
          ),
          const Spacer(
            flex: 2,
          ),
          FittedBox(
            child: TextButton(
                onPressed: () {
                  RoutHelper.routHelper.gotToPage(FirebaseConfiguration.routeName);

                },
                child: Row(
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey.withOpacity(0.8)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
