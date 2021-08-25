import 'dart:io';

import 'package:chat_app_firebase/Auth/helpers/auth_helper.dart';
import 'package:chat_app_firebase/Auth/helpers/firebase_storage_helper.dart';
import 'package:chat_app_firebase/Auth/helpers/firestore_helper.dart';
import 'package:chat_app_firebase/Auth/models/country_model.dart';
import 'package:chat_app_firebase/Auth/models/user_model.dart';
import 'package:chat_app_firebase/Auth/ui/login_page.dart';
import 'package:chat_app_firebase/services/custom_dialog.dart';
import 'package:chat_app_firebase/services/rout_helper.dart';
import 'package:chat_app_firebase/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../models/register_request.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  List<UserModel> allUsers;

  AuthProvider() {
    getCountriesFromFireStore();
  }

  resetControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
    fNameController.clear();
    lNameController.clear();
  }

  List<CountryModel> countries;
  List<dynamic> cities = [];
  CountryModel selectedCountry;
  dynamic selectedCity;

  /// for selectedCountry
  selectCountry(CountryModel countryModel) {
    this.selectedCountry = countryModel;
    this.cities = countryModel.cities;
    selectCity(cities.first.toString());
    notifyListeners();
  }

  /// for selectedCity
  selectCity(dynamic city) {
    this.selectedCity = city;
    notifyListeners();
  }

  /// for getting all Countries from fireStore
  getCountriesFromFireStore() async {
    List<CountryModel> countries =
        await FirestoreHelper.firestoreHelper.getAllCountriesFromFireStore();
    this.countries = countries;
    selectCountry(countries.first);
    notifyListeners();
  }

  /// upload images
  File file;
  selectedFile() async{
    XFile imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile.path);
    notifyListeners();
  }

  register() async {
    UserCredential userCredential =  await AuthHelper.authHelper
        .signup(emailEditingController.text, passwordEditingController.text);
    String imageUrl =
    await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(file);
      RegisterRequest registerRequest =   RegisterRequest(
        id: userCredential.user.uid,
        email: emailEditingController.text,
        password: passwordEditingController.text,
        fName: fNameController.text,
        lName: lNameController.text,
        city: selectedCity,
        country: selectedCountry.name,
        imageUrl: imageUrl,);
    await FirestoreHelper.firestoreHelper.addUserToFireStore(registerRequest);
    await AuthHelper.authHelper.verifyEmail();
    await AuthHelper.authHelper.logOut();
    await RoutHelper.routHelper.gotToPageWithReplacement(LoginPage.routeName);
    resetControllers();
  }

  login() async {
    UserCredential userCredential = await AuthHelper.authHelper
        .signIn(emailEditingController.text, passwordEditingController.text);
    FirestoreHelper.firestoreHelper
        .getUserFromFirestore(userCredential.user.uid);
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

  sendVerification() {
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
    allUsers = await FirestoreHelper.firestoreHelper.getAllUsersFromFirestore();
    notifyListeners();
  }
}
