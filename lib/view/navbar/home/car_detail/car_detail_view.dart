import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:carnava_admin_panel/res/assets/app_icons.dart';
import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/home/car_detail/widgets/feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailView extends StatelessWidget {
  final CarModel carModel;
  const CarDetailView({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text(carModel.name, style: AppTextStyles.h1Bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.3,
              width: Get.width,
              child: Image.network(carModel.imageUrl),
            ),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FeatureWidget(icon: AppIcons.transmissionIcon, title: "Transmission", dbValue: carModel.transmission),
                FeatureWidget(icon: AppIcons.fuelIcon, title: "Fuel Type", dbValue: carModel.fuelType),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FeatureWidget(
                    icon: AppIcons.seatIcon,
                    title: "Doors And Seats",
                    dbValue: "${carModel.doors} Doors & ${carModel.seats} Seats"),
                FeatureWidget(icon: AppIcons.acIcon, title: "Air Condition", dbValue: carModel.airConditioning),
              ],
            )
          ],
        ),
      ),
    );
  }
}
