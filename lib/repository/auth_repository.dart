import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:carnava_admin_panel/data/services/firebase_auth_services.dart';
import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/services/firestore_auth_services.dart';

class AuthRepository {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  Future<void> signInUser(String email, String password) async {
    User? user = await _authServices.signInWithEmail(email, password);
    if (user != null) {
      await FireStoreServices().getUser(user.uid);
    } else {
      throw GeneralException('Error while fetching user');
    }
  }

  Future<void> signUpUser(
      {required String username, required String email, required String password, required String image}) async {
    User? user = await _authServices.signUpWithEmail(email, password);
    if (user != null) {
      AdminModel adminModel = AdminModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        username: username,
        image: image,
        email: email,
        memberSince: DateTime.now(),
      );
      await FireStoreServices().saveUser(adminModel);
    } else {
      throw GeneralException('Error while Saving user');
    }
  }

  Future<void> signOut() async {
    await _authServices.signOut();
  }

  Future<AdminModel?> getUser(String userId) async {
    return await FireStoreServices().getUser(userId);
  }
}
