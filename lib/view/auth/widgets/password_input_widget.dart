import 'package:carnava_admin_panel/view_model/controllers/auth/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/text_styles/app_text_styles.dart';

class PasswordInputWidget extends StatelessWidget {
  final TextEditingController controller;
  PasswordInputWidget({super.key, required this.controller});

  final authController = Get.put(AuthViewController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        obscureText: authController.isPassVisible.value,
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColors.textInputColor,
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: "Password",
          hintStyle: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey),
          prefixIcon: Icon(Icons.lock_open, size: Get.height * 0.03, color: AppColors.primaryGrey),
          suffixIcon: GestureDetector(
            onTap: () {
              authController.setPasswordVisibility();
            },
            child: Icon(
              authController.isPassVisible.value ? Icons.visibility_off : Icons.visibility,
              size: Get.height * 0.03,
              color: AppColors.primaryGrey,
            ),
          ),
        ),
      ),
    );
  }
}
