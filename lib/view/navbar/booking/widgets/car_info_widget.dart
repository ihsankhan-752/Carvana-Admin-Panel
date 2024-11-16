import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../../../../models/car_model.dart';

class CarInfoWidget extends StatelessWidget {
  final CarModel car;
  const CarInfoWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(car.imageUrl, width: Get.width * 0.4, fit: BoxFit.scaleDown),
        Container(height: Get.height * 0.15, width: 0.5, color: AppColors.primaryColor),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "${car.name} ", style: AppTextStyles.h1Bold.copyWith(fontSize: 12)),
                  TextSpan(text: "(${car.brand})", style: AppTextStyles.h1.copyWith(fontSize: 12)),
                ]),
              ),
              const SizedBox(height: 5),
              Text(
                "${car.pricePerHour.toStringAsFixed(1)} Per hour",
                style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                car.transmission,
                style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                car.fuelType,
                style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                "A/C :${car.airConditioning}",
                style: AppTextStyles.h1Bold.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
