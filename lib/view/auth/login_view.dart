import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/view/auth/widgets/auth_footer_widget.dart';
import 'package:carnava_admin_panel/view/auth/widgets/email_input_widget.dart';
import 'package:carnava_admin_panel/view/auth/widgets/forgot_password_widget.dart';
import 'package:carnava_admin_panel/view/auth/widgets/password_input_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_colors.dart';
import '../../res/routes/routes_name.dart';
import '../../res/text_styles/app_text_styles.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final authController = Get.put(AuthViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.2),
              Text("Welcome Back", style: AppTextStyles.h1Bold.copyWith(fontSize: 25)),
              Text(
                "Log in to your account using\nEmail",
                textAlign: TextAlign.center,
                style: AppTextStyles.h2.copyWith(fontSize: 12, color: AppColors.primaryGrey, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              EmailInputWidget(controller: authController.emailController.value),
              SizedBox(height: Get.height * 0.02),
              PasswordInputWidget(controller: authController.passwordController.value),
              SizedBox(height: Get.height * 0.02),
              const ForgotPasswordWidget(),
              SizedBox(height: Get.height * 0.04),
              const PrimaryButton(
                title: "Log In",
              ),
              SizedBox(height: Get.height * 0.045),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.signUpView);
                },
                child: const AuthFooterWidget(
                  title: "First time here?",
                  value: "Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
