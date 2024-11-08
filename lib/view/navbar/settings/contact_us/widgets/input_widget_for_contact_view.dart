import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../res/colors/app_colors.dart';

class InputWidgetForContactView extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? inputType;
  const InputWidgetForContactView(
      {super.key, required this.title, required this.hintText, required this.controller, this.inputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h1.copyWith(color: AppColors.primaryBlack, fontFamily: 'normal')),
        const SizedBox(height: 5),
        TextField(
          keyboardType: inputType ?? TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
              fillColor: AppColors.primaryGrey.withOpacity(0.1),
              border: InputBorder.none,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primaryBlack.withOpacity(0.3),
              )),
        )
      ],
    );
  }
}
