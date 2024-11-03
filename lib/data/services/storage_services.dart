import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  Future<String?> uploadImage(File imageFile) async {
    try {
      FirebaseStorage fs = FirebaseStorage.instance;
      Reference ref = fs.ref().child(DateTime.now().millisecondsSinceEpoch.toString());
      await ref.putFile(imageFile);
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
