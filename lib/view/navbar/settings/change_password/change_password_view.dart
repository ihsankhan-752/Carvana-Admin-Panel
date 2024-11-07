import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/change_password/widgets/change_password_text_input_widget.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        title: Text("Change Password", style: AppTextStyles.h1Bold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const Center(child: Icon(Icons.lock, size: 80, color: AppColors.primaryColor)),
            Text("Old Password"),
            ChangePasswordTextInputWidget(
              controller: _oldPassController,
              validator: (v) {
                if (v!.isEmpty) {
                  return "Enter Old Password";
                } else {
                  return null;
                }
              },
              hintText: "Enter your old password",
              errorText: "",
            ),
            ChangePasswordTextInputWidget(
              controller: _newPassController,
              validator: (v) {
                if (v!.isEmpty) {
                  return "New Password Must Be Filled";
                } else {
                  return null;
                }
              },
              hintText: "Enter new password",
            ),
            ChangePasswordTextInputWidget(
              controller: TextEditingController(),
              validator: (v) {
                if (v != _newPassController.text) {
                  return "Password Not Matching";
                } else if (v!.isEmpty) {
                  return "Re-Enter New Password";
                } else {
                  return null;
                }
              },
              hintText: "Re-Enter new password",
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
