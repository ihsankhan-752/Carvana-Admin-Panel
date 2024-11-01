import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_colors.dart';
import '../../text_styles/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  const PrimaryButton({super.key, this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              AppColors.secondaryColor,
              AppColors.primaryColor,
            ],
          ),
        ),
        child: Center(
          child: Text(title!, style: AppTextStyles.h1Bold.copyWith(color: AppColors.primaryWhite)),
        ),
      ),
    );
  }
}
