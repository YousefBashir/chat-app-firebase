import 'package:chat_app_firebase/Auth/helpers/auth_helper.dart';
import 'package:chat_app_firebase/Auth/helpers/firestore_helper.dart';
import 'package:chat_app_firebase/Auth/models/country_model.dart';
import 'package:chat_app_firebase/Auth/models/user_model.dart';
import 'package:chat_app_firebase/Auth/ui/login_page.dart';
import 'package:chat_app_firebase/services/custom_dialog.dart';
import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:chat_app_firebase/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/register_request.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  List<UserModel> allUsers;
  AuthProvider(){
    getCountryiesFromFireStore();
  }




  resetControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
  }
  List<String>cites=[];
  CountryModel selectedCountry;
  String selectedCity;
  selectCountry(CountryModel countryModel){
    this.selectedCountry=countryModel;
    this.cites=countryModel.cities;
    notifyListeners();
  }
  List<CountryModel>countryies;
  getCountryiesFromFireStore()async{
    List<CountryModel> countryies= await FirestoreHelper.firestoreHelper.getCountriesFirestore();
    this.countryies=countryies;
    notifyListeners();
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
    UserCredential userCredential = await AuthHelper.authHelper
        .signIn(emailEditingController.text, passwordEditingController.text);
    FirestoreHelper.firestoreHelper.addUserToFireStore(
      RegisterRequest(
        id: userCredential.user.uid,
        email: emailEditingController.text,
        password: passwordEditingController.text,
        fName: fNameController.text,
        lName: lNameController.text,
        city: cityController.text,
        country: countryController.text,
      ),
    );
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
  getCurrentUser() {
    User user = AuthHelper.authHelper.getCurrentUser();
    return user;
  }

  getUserFromFirestore(String userId) async {
    FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
  }

  getAllUsersFromFirestore() async {
    allUsers =
    await FirestoreHelper.firestoreHelper.getAllUsersFromFirestore();
    notifyListeners();
  }
}
