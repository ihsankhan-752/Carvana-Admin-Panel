import 'package:carnava_admin_panel/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreMembersServices {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Stream<List<UserModel>> getAllUsers() {
    return userCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromMap(doc)).toList();
    });
  }
}
