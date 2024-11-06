import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreAdminServices {
  final CollectionReference adminCollection = FirebaseFirestore.instance.collection('admins');

  Future<void> updateAdminImageAndUsername(String image, String username) async {
    try {
      await adminCollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
        'image': image,
        'username': username,
      });
    } on FirebaseException catch (e) {
      throw GeneralException(e.message!);
    }
  }

  Future<String?> currentImage() async {
    DocumentSnapshot adminSnap = await adminCollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    String adminImage = adminSnap['image'];
    return adminImage;
  }

  Future<String?> currentUsername() async {
    DocumentSnapshot adminSnap = await adminCollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    String username = adminSnap['username'];
    return username;
  }
}
