import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/change_password/widgets/change_password_text_input_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/auth/auth_view_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final AuthViewController authController = Get.put(AuthViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        title: Text("Change Password", style: AppTextStyles.h1Bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Icon(Icons.lock, size: 100, color: AppColors.primaryColor)),
              const SizedBox(height: 20),
              const Text("Old Password"),
              ChangePasswordTextInputWidget(
                controller: authController.oldPassController.value,
                hintText: "Enter Old Password",
              ),
              const SizedBox(height: 20),
              const Text("New Password"),
              ChangePasswordTextInputWidget(
                controller: authController.newPassController.value,
                hintText: "Enter new password",
              ),
              const SizedBox(height: 20),
              const Text("New Password"),
              ChangePasswordTextInputWidget(
                controller: authController.confirmNewPassword.value,
                hintText: "Re-Enter new password",
              ),
              const SizedBox(height: 30),
              Obx(() {
                return authController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : PrimaryButton(
                        onPressed: () {
                          authController
                              .changePassword(
                            email: FirebaseAuth.instance.currentUser!.email!,
                            password: authController.oldPassController.value.text,
                            newPassword: authController.newPassController.value.text,
                            confirmNewPassword: authController.confirmNewPassword.value.text,
                          )
                              .whenComplete(() {
                            authController.clearTextInputs();
                          });
                        },
                        title: "Change Password",
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
