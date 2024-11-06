import 'package:flutter/material.dart';

import '../../../../../res/colors/app_colors.dart';

class EditUsernameInputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const EditUsernameInputWidget({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primaryGrey.withOpacity(0.1),
        border: InputBorder.none,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryGrey.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryGrey.withOpacity(0.1)),
        ),
      ),
    );
  }
}
