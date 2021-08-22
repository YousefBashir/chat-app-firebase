import 'package:chat_app_firebase/Auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/register_request.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore  firebaseFirestore = FirebaseFirestore.instance;

  addUserToFireStore(RegisterRequest registerRequest) async {
    try {
      // await firestore.collection('Users').add(registerRequest.toMap());
      await  firebaseFirestore
          .collection('Users')
          .doc(registerRequest.id)
          .set(registerRequest.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }

  getUserFromFirestore(String userId) async {
    DocumentSnapshot documentSnapshot =
    await  firebaseFirestore.collection('Users').doc(userId).get();
    print(documentSnapshot.data);
  }
  Future<List<UserModel>> getAllUsersFromFirestore() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('Users').get();

    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    List<UserModel> users =
    docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(users.length);
    return users;
  }
}

