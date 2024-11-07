import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditionTextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const TermsAndConditionTextInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 7,
      maxLength: 250,
      decoration: InputDecoration(
        hintText: "Terms & Conditions",
        border: InputBorder.none,
        fillColor: AppColors.primaryGrey.withOpacity(0.1),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
