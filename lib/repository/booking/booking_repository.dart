import '../../data/services/booking/booking_firestore_services.dart';
import '../../models/booking/booking_model.dart';

class BookingRepository {
  BookingFireStoreServices bookingFireStoreServices = BookingFireStoreServices();

  Future<void> addBooking(BookingModel bookingModel, String bookingId) async {
    await bookingFireStoreServices.addBooking(bookingModel, bookingId);
  }

  Future<void> updatePaymentType(String bookingId, String paymentType) async {
    await bookingFireStoreServices.updatePaymentType(bookingId, paymentType);
  }

  Stream<List<BookingModel>> getMyBooking() {
    return bookingFireStoreServices.getMyBooking();
  }
}
