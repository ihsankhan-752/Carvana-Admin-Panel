import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class CarNameTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const CarNameTextInput({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Car Name",
          style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey),
        ),
        const SizedBox(height: 05),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: AppColors.primaryGrey.withOpacity(0.1),
            filled: true,
            hintText: hintText ?? "S2 Sedan",
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
