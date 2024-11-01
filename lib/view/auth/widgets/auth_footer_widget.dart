import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/text_styles/app_text_styles.dart';

class AuthFooterWidget extends StatelessWidget {
  final String? title, value;
  const AuthFooterWidget({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: title!, style: AppTextStyles.h2.copyWith(fontSize: 14)),
          TextSpan(
            text: "  $value",
            style: AppTextStyles.h2.copyWith(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
