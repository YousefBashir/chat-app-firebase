import 'package:chat_app_firebase/Auth/providers/auth_provider.dart';
import 'package:chat_app_firebase/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_textField.dart';

class ResetPasswordPage extends StatelessWidget {
  static final routeName = 'reset';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
          return Scaffold(
            body: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reset password account',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Forget your password account! reset it again',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.grey.shade600.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  CustomTextField(
                                      provider.emailEditingController, 'Email',Icons.email)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomButton(
                                'Reset password', provider.resetPassword),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          );
        }));
  }
}
