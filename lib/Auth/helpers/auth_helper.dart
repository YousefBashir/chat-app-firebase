import 'package:chat_app_firebase/services/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialog.customDialog
            .showCustomDialog('The password provided is to weak');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.customDialog
            .showCustomDialog('The account already exists for that email.');
      }
    }
  }

  signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.customDialog
            .showCustomDialog('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.customDialog
            .showCustomDialog('Wrong password provided for that user.');
      }
    }
  }

  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    CustomDialog.customDialog.showCustomDialog(
        'We had sent email for reset password,please check your email');
  }

  bool checkEmailVerification() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  verifyEmail() async {
    await firebaseAuth.currentUser.sendEmailVerification();
    CustomDialog.customDialog
        .showCustomDialog('Verification email has been sent!');
  }

  logOut() async {
    firebaseAuth.signOut();
  }
}
