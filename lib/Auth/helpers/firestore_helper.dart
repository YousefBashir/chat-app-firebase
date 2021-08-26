import 'package:chat_app_firebase/Auth/models/country_model.dart';
import 'package:chat_app_firebase/Auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/register_request.dart';

class FirestoreHelper {
  FirestoreHelper._();

  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addUserToFireStore(RegisterRequest registerRequest) async {
    try {
      // await firestore.collection('Users').add(registerRequest.toMap());
      await firebaseFirestore
          .collection('Users')
          .doc(registerRequest.id)
          .set(registerRequest.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }

 Future<UserModel> getUserFromFirestore(String userId) async {
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection('Users').doc(userId).get();
    return UserModel.fromMap(documentSnapshot.data());
  }

  Future<List<CountryModel>> getAllCountriesFromFireStore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('countries').get();
    List<CountryModel> countries = querySnapshot.docs.map((e) {
      Map map = e.data();
      map['id'] = e.id;
      return CountryModel.fromMap(map);
    }).toList();
    return countries;
  }

  Future<List<UserModel>> getAllUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firebaseFirestore.collection('Users').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<UserModel> users =
    docs.map((e) => UserModel.fromMap(e.data())).toList();

    return users;
  }
}
