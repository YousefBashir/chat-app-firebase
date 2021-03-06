import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageHelper {
  FirebaseStorageHelper._();
  static FirebaseStorageHelper firebaseStorageHelper =
  FirebaseStorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadImage(File file) async {

    /// make a reference for this file in firebase storage
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    String path = 'images/profiles/$fileName';
    Reference reference = firebaseStorage.ref(path);

    ///  upload the file to the defined reference
    await reference.putFile(file);

    //3 get the file url
    String imageUrl = await reference.getDownloadURL();

    return imageUrl;
  }
}