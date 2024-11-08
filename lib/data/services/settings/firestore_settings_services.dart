import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:carnava_admin_panel/models/contact_us_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSettingsServices {
  final CollectionReference termsAndConditionCollection = FirebaseFirestore.instance.collection('termsAndConditions');
  final CollectionReference contactUsCollection = FirebaseFirestore.instance.collection('contactUsCollection');

  Future<void> addTermsAndConditions(String termsAndConditions) async {
    try {
      await termsAndConditionCollection.doc("1").set({
        'termsAndConditions': termsAndConditions,
        'addedDate': DateTime.now(),
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> addContactUs(ContactUsModel model) async {
    try {
      await contactUsCollection.doc("1").set(model.toMap());
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
