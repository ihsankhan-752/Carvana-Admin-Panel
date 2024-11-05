import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel car;
  const CarCardWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      color: AppColors.primaryWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryGrey.withOpacity(0.1),
                ),
                child: Center(
                  child: Icon(Icons.more_vert, color: AppColors.primaryGrey.withOpacity(0.7), size: 20),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: Image.network(car.imageUrl, fit: BoxFit.cover),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(car.name, style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w900)),
                    Text(car.transmission, style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 13)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.grade_outlined, size: 25, color: AppColors.golderColor),
                      const SizedBox(width: 5),
                      Text("4.8", style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(width: 3),
                      Text("(150)", style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 14)),
                      const Spacer(),
                      Text("\$ ${car.pricePerHour.toStringAsFixed(1)}/Day",
                          style: AppTextStyles.h1Bold
                              .copyWith(fontWeight: FontWeight.w900, fontSize: 14, color: AppColors.primaryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
