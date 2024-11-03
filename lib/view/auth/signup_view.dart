import 'package:carnava_admin_panel/res/routes/routes_name.dart';
import 'package:carnava_admin_panel/view/auth/widgets/auth_footer_widget.dart';
import 'package:carnava_admin_panel/view/auth/widgets/email_input_widget.dart';
import 'package:carnava_admin_panel/view/auth/widgets/password_input_widget.dart';
import 'package:carnava_admin_panel/view/auth/widgets/username_input_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_colors.dart';
import '../../res/components/buttons/primary_button.dart';
import '../../res/text_styles/app_text_styles.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
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
              Text("Create New Account", style: AppTextStyles.h1Bold.copyWith(fontSize: 20)),
              Text(
                "Set up your username, email & password.\nyou can always change it later",
                textAlign: TextAlign.center,
                style: AppTextStyles.h2.copyWith(fontSize: 12, color: AppColors.primaryGrey, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              UsernameInputWidget(controller: authController.usernameController.value),
              SizedBox(height: Get.height * 0.02),
              EmailInputWidget(controller: authController.emailController.value),
              SizedBox(height: Get.height * 0.02),
              PasswordInputWidget(controller: authController.passwordController.value),
              SizedBox(height: Get.height * 0.04),
              Obx((){
                return  authController.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : PrimaryButton(
                  onPressed: () {
                    authController
                        .signUpUser(
                      username: authController.usernameController.value.text,
                      email: authController.emailController.value.text,
                      password: authController.passwordController.value.text,
                    )
                        .whenComplete(() {
                      authController.clearTextInputs();
                    });
                  },
                  title: "Sign Up",
                );
              }),

              SizedBox(height: Get.height * 0.045),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.loginView);
                },
                child: const AuthFooterWidget(
                  title: "Already have an account?",
                  value: "Log In",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
