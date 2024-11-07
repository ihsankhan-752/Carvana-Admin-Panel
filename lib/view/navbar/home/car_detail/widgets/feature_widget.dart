import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class FeatureWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String dbValue;
  const FeatureWidget({super.key, required this.icon, required this.title, required this.dbValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              icon,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(title, style: AppTextStyles.h1Bold),
          const SizedBox(height: 5),
          Text(dbValue, style: AppTextStyles.h1.copyWith(fontSize: 14, color: AppColors.primaryGrey))
        ],
      ),
    );
  }
}
