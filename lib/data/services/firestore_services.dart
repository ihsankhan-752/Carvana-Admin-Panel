import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../app_exceptions.dart';

class FireStoreServices {
  final CollectionReference adminCollection = FirebaseFirestore.instance.collection('admins');

  Future<void> saveUser(AdminModel adminModel) async {
    try {
      await adminCollection.doc(FirebaseAuth.instance.currentUser!.uid).set(adminModel.toMap());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<AdminModel?> getUser(String userId) async {
    try {
      DocumentSnapshot snap = await adminCollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
      if (snap.exists) {
        return AdminModel.fromMap(snap);
      } else {
        throw GeneralException("User Not Found");
      }
    } on FirebaseException catch (e) {
      throw FirebaseDatabaseException("Database Error");
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
