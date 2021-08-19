import 'package:chat_app_firebase/Auth/helpers/auth_helper.dart';
import 'package:chat_app_firebase/Auth/ui/login_page.dart';
import 'package:chat_app_firebase/services/custom_dialog.dart';
import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:chat_app_firebase/ui/home_page.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  resetControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
  }

  register() async {
    await AuthHelper.authHelper
        .signUp(emailEditingController.text, passwordEditingController.text);
     await AuthHelper.authHelper.verifyEmail();
    await  AuthHelper.authHelper.logOut();
     await RoutHelper.routHelper.gotToPageWithReplacement(LoginPage.routeName);
    resetControllers();
  }

  login() async {
    await AuthHelper.authHelper
        .signIn(emailEditingController.text, passwordEditingController.text);
    bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    if (isVerifiedEmail) {
      RoutHelper.routHelper.gotToPageWithReplacement(HomePage.routeName);
    } else {
      CustomDialog.customDialog.showCustomDialog(
          "You have to verify your email, press ok to send another email",
          sendVerification);
    }

    resetControllers();
  }
  sendVerification(){
    AuthHelper.authHelper.verifyEmail();
    AuthHelper.authHelper.logOut();

  }

  resetPassword() async {
    AuthHelper.authHelper.resetPassword(emailEditingController.text);
    resetControllers();
  }
}
