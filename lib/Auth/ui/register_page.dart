import 'package:chat_app_firebase/Auth/providers/auth_provider.dart';
import 'package:chat_app_firebase/Auth/ui/login_page.dart';
import 'package:chat_app_firebase/global_widgets/custom_button.dart';
import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_textField.dart';

class RegisterPage extends StatelessWidget {
  static final routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade800,
              Colors.lightBlue.shade700,
              Colors.blue.shade500,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      child: Image.asset(
                        'assets/images/logoo.jpg',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Create an account,its free!',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),

              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all( 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600.withOpacity(0.2),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CustomTextField(
                                  provider.fNameController,
                                  'First Name',Icons.person),
                              CustomTextField(
                                  provider.lNameController,
                                  'Last Name',Icons.person_rounded),
                              CustomTextField(
                                  provider.emailEditingController, 'Email',Icons.email),
                              CustomTextField(
                                  provider.passwordEditingController,
                                  'Password',Icons.lock),
                              CustomTextField(
                                  provider.countryController,
                                  'Country',Icons.home_outlined),
                              CustomTextField(
                                  provider.cityController,
                                  'City',Icons.location_city),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have account?'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Text(
                                "SignIn",
                                style: TextStyle(
                                    color: Colors.blue.shade600,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                RoutHelper.routHelper
                                    .gotToPage(LoginPage.routeName);
                              },
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton('Create an account', provider.register),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
