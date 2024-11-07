import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSettingsServices {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('termsAndConditions');

  Future<void> addTermsAndConditions(String termsAndConditions) async {
    try {
      await collectionReference.doc("1").set({
        'termsAndConditions': termsAndConditions,
        'addedDate': DateTime.now(),
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
