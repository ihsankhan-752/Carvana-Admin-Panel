import 'package:get/get.dart';

import '../../../models/booking/booking_model.dart';
import '../../../repository/booking/booking_repository.dart';
import '../../../utils/utils.dart';

class BookingViewController extends GetxController {
  final BookingRepository bookingRepository = BookingRepository();
  RxBool isLoading = false.obs;
  Rx<Stream<List<BookingModel>>> getMyBooking = Rx<Stream<List<BookingModel>>>(const Stream.empty());

  @override
  void onInit() {
    super.onInit();
    getAllBooking();
  }

  void getAllBooking() {
    getMyBooking.value = bookingRepository.getMyBooking();
  }

  Future<void> updateBookingStatus(String status, String bookingId) async {
    try {
      isLoading.value = true;
      await bookingRepository.updateBookingStatus(bookingId, status);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Utils.toastMessage(e.toString());
    }
  }
}
