import 'package:carnava_admin_panel/core/services/notification_services.dart';
import 'package:carnava_admin_panel/models/user_model.dart';
import 'package:carnava_admin_panel/view/navbar/booking/widgets/booking_info_widget.dart';
import 'package:carnava_admin_panel/view/navbar/booking/widgets/car_info_widget.dart';
import 'package:carnava_admin_panel/view/navbar/booking/widgets/custom_popup_menu_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/booking/booking_model.dart';
import '../../../models/car_model.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/text_styles/app_text_styles.dart';
import '../../../view_model/controllers/booking/booking_view_controller.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});
  final bookingController = Get.put(BookingViewController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BookingModel>>(
      stream: bookingController.getMyBooking.value,
      builder: (ctx, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No bookings found", style: AppTextStyles.h1Bold));
        }

        final bookingList = snapshot.data!;

        return ListView.builder(
          itemCount: bookingList.length,
          itemBuilder: (context, index) {
            final booking = bookingList[index];

            return StreamBuilder(
                stream: FirebaseFirestore.instance.collection('cars').doc(booking.carId).snapshots(),
                builder: (context, carSnap) {
                  if (!carSnap.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final car = CarModel.fromMap(carSnap.data!);
                  return Card(
                    color: AppColors.primaryWhite,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text("${index + 1}",
                                      style: AppTextStyles.h1.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Text(
                                "Car Information",
                                style: AppTextStyles.h1
                                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                              ),
                              CustomPopupMenuWidget(
                                onSelected: (value) {
                                  if (value == 0) {
                                    bookingController.updateBookingStatus("Approve", booking.bookingId);
                                    NotificationServices().sendNotificationToSpecificUser(
                                      title: "Congratulations",
                                      body: "Your Booking is Approved",
                                      toUserId: booking.userId,
                                    );
                                  } else if (value == 1) {
                                    bookingController.updateBookingStatus("Cancel", booking.bookingId);
                                    NotificationServices().sendNotificationToSpecificUser(
                                      title: "Sorry",
                                      body: "Your Booking is Cancelled",
                                      toUserId: booking.userId,
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          CarInfoWidget(car: car),
                          const Divider(),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Booking Information",
                              style: AppTextStyles.h1
                                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                            ),
                          ),
                          const SizedBox(height: 10),
                          BookingInfoWidget(booking: booking),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "User Information",
                              style: AppTextStyles.h1
                                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                            ),
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('users').doc(booking.userId).snapshots(),
                              builder: (context, userSnap) {
                                if (!userSnap.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                final user = UserModel.fromMap(userSnap.data!);

                                return Text(user.username);
                              })
                        ],
                      ),
                    ),
                  );
                });
          },
        );
      },
    );
  }
}
