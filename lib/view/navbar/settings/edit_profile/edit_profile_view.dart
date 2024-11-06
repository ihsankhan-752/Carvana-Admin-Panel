import 'dart:io';

import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/res/components/image_picking_widget.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/edit_profile/widgets/edit_username_input_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/admin_profile_view_controller.dart';
import 'package:carnava_admin_panel/view_model/controllers/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  final AdminModel adminModel;

  const EditProfileView({super.key, required this.adminModel});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final imageController = Get.put(ImageController());
  final authController = Get.put(AuthViewController());
  final adminController = Get.put(AdminProfileViewController());

  @override
  void initState() {
    super.initState();
    authController.usernameController.value.text = widget.adminModel.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("Edit Profile", style: AppTextStyles.h1Bold),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              if (widget.adminModel.image.isEmpty && imageController.image.value == null) ...{
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                    child: GestureDetector(
                        onTap: () {
                          imageController.pickImage(ImageSource.camera);
                        },
                        child: const Icon(Icons.camera_alt, size: 30)),
                  ),
                )
              },
              if (imageController.image.value != null) ...{
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                    backgroundImage: FileImage(File(imageController.image.value!.path)),
                  ),
                )
              },
              if (widget.adminModel.image.isNotEmpty) ...{
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                    backgroundImage: NetworkImage(widget.adminModel.image),
                  ),
                )
              },
              const SizedBox(height: 20),
              Text("username", style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontFamily: 'normal')),
              EditUsernameInputWidget(
                hintText: widget.adminModel.username,
                controller: authController.usernameController.value,
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          return adminController.isLoading.value
              ? SizedBox(
                  height: 50,
                  width: Get.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : PrimaryButton(
                  title: "Update",
                  onPressed: () {
                    adminController.updateAdminImageAndUsername(
                      username: authController.usernameController.value.text,
                      image: imageController.image.value,
                    );
                  },
                );
        }),
      ),
    );
  }
}
