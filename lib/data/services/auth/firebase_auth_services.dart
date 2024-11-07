import 'package:firebase_auth/firebase_auth.dart';

import '../../app_exceptions.dart';

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

  Future<bool> checkOldPassword(String email, String password) async {
    try {
      AuthCredential authCredential = EmailAuthProvider.credential(email: email, password: password);
      var credentialResult = await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(authCredential);
      return credentialResult.user != null;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error during re-authentication: ${e.code} - ${e.message}");
      return false;
    } catch (e) {
      print("Error during re-authentication: $e");
      return false;
    }
  }

  Future<void> changeUserPassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      print("Password updated successfully");
    } on FirebaseAuthException catch (e) {
      print("Error updating password: ${e.code} - ${e.message}");
    } catch (e) {
      print("General error during password update: $e");
    }
  }
}
