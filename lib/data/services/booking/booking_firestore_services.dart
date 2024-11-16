import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/booking/booking_model.dart';
import '../../app_exceptions.dart';

class BookingFireStoreServices {
  final CollectionReference bookingCollection = FirebaseFirestore.instance.collection('booking');
  final CollectionReference carCollection = FirebaseFirestore.instance.collection('cars');

  Future<void> addBooking(BookingModel bookingModel, String bookingId) async {
    try {
      await bookingCollection.doc(bookingId).set(bookingModel.toMap());
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> updatePaymentType(String bookingId, String paymentType) async {
    try {
      await bookingCollection.doc(bookingId).update({
        'paymentType': paymentType,
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Stream<List<BookingModel>> getMyBooking() {
    return bookingCollection.where('sellerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots().map((snap) {
      return snap.docs.map((doc) => BookingModel.fromMap(doc)).toList();
    });
  }
}
