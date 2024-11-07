import 'package:flutter/material.dart';

import '../../../../../res/colors/app_colors.dart';

class ChangePasswordTextInputWidget extends StatelessWidget {
  final String? Function(String? v)? validator;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  const ChangePasswordTextInputWidget({super.key, this.validator, this.hintText, this.errorText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
        ),
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.primaryGrey.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryGrey.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryGrey.withOpacity(0.1)),
          ),
          hintText: hintText!,
        ),
      ),
    );
  }
}
