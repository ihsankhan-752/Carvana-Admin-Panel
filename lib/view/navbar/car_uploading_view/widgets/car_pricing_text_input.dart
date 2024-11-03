import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class CarPricingTextInput extends StatelessWidget {
  const CarPricingTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price per hour",
          style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey),
        ),
        const SizedBox(height: 05),
        TextField(
          decoration: InputDecoration(
            fillColor: AppColors.primaryGrey.withOpacity(0.1),
            filled: true,
            hintText: "240 USD",
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryGrey.withOpacity(0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryGrey.withOpacity(0.1)),
            ),
          ),
        ),
      ],
    );
  }
}