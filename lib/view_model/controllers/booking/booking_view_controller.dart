import 'package:get/get.dart';

import '../../../models/booking/booking_model.dart';
import '../../../repository/booking/booking_repository.dart';

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
}
