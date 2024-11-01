import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/routes/routes_name.dart';
import '../../../res/text_styles/app_text_styles.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RoutesName.forgotPasswordView);
        },
        child: GradientText('Forgot Password ?', style: AppTextStyles.h1Bold.copyWith(fontSize: 14), colors: const [
          AppColors.secondaryColor,
          AppColors.primaryColor,
        ]),
      ),
    );
  }
}
