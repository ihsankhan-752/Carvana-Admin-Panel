import '../../data/services/booking/booking_firestore_services.dart';
import '../../models/booking/booking_model.dart';

class BookingRepository {
  BookingFireStoreServices bookingFireStoreServices = BookingFireStoreServices();

  Future<void> updateBookingStatus(String bookingId, String status) async {
    await bookingFireStoreServices.updateBookingStatus(bookingId, status);
  }

  Stream<List<BookingModel>> getMyBooking() {
    return bookingFireStoreServices.getMyBooking();
  }
}
