import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../res/text_styles/app_text_styles.dart';
import '../../../../models/booking/booking_model.dart';
import '../../../../res/colors/app_colors.dart';

class BookingInfoWidget extends StatelessWidget {
  final BookingModel booking;
  const BookingInfoWidget({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Booking Date : ${DateFormat("MM/dd/yyyy").format(booking.pickUpDate)}",
          style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 7),
        Text(
          "Pick-Up Time : ${booking.pickUpTime}",
          style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 7),
        Text(
          "Return Time : ${booking.returnTime}",
          style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 7),
        Text(
          "Total Price : ${booking.totalPrice.toStringAsFixed(1)} USD",
          style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 7),
        RichText(
          text: TextSpan(children: [
            TextSpan(text: "Booking Status : ", style: AppTextStyles.h1Bold.copyWith(fontSize: 12)),
            TextSpan(
              text: booking.bookingStatus.toUpperCase(),
              style: AppTextStyles.h1.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: booking.bookingStatus == "Pending"
                    ? Colors.blue
                    : booking.bookingStatus == "Cancel"
                        ? AppColors.alertColor
                        : AppColors.primaryColor,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
