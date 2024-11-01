import 'package:firebase_auth/firebase_auth.dart';

import '../app_exceptions.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User>? signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseUserNotFoundException("No user found for this email");
      } else if (e.code == 'wrong-password') {
        throw FirebaseInvalidCredentialException("Wrong password");
      } else if (e.code == 'too-many-requests') {
        throw FirebaseTooManyRequestsException("Too many attempt, please try later");
      } else {
        throw GeneralException("An unknown error occurred.");
      }
    } catch (e) {
      throw FirebaseNetworkException("Unable to connect to Firebase.");
    }
  }

  Future<User>? signUpWithEmail(String email, String password) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return res.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseUserNotFoundException("No user found for this email");
      } else if (e.code == 'wrong-password') {
        throw FirebaseInvalidCredentialException("Wrong password");
      } else if (e.code == 'too-many-requests') {
        throw FirebaseTooManyRequestsException("Too many attempt, please try later");
      } else {
        throw GeneralException("An unknown error occurred.");
      }
    } catch (e) {
      throw FirebaseNetworkException("Unable to connect to Firebase.");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
