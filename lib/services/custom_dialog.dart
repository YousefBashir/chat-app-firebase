import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  CustomDialog._();

  static CustomDialog customDialog = CustomDialog._();

  showCustomDialog(String message, [Function function]) {
    showDialog(
        context: RoutHelper.routHelper.navKey.currentContext,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    if (function == null) {
                      RoutHelper.routHelper.back();
                    } else {
                      function();
                      RoutHelper.routHelper.back();
                    }
                  },
                  child: Text('Ok')),
            ],
          );
        });
  }
}
