import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageServices {
  Future<String?> uploadUintListImage(Uint8List imageFile) async {
    try {
      FirebaseStorage fs = FirebaseStorage.instance;
      Reference ref = fs.ref().child(DateTime.now().millisecondsSinceEpoch.toString());
      await ref.putData(imageFile);
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<String?> uploadFileImage(File imageFile) async {
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
