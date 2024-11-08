import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/routes/routes_name.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:carnava_admin_panel/view/navbar/settings/widgets/admin_information_widget.dart';
import 'package:carnava_admin_panel/view/navbar/settings/widgets/profile_list_tile_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/auth/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final AuthViewController authViewController = Get.put(AuthViewController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      AdminModel? admin = authViewController.adminModel.value;
      if (admin == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              AdminInformationWidget(admin: admin),
              const SizedBox(height: 20),
              // const ProfileListTileWidget(
              //   title: "My Profile",
              //   icon: Icons.person,
              // ),
              Divider(color: AppColors.primaryGrey.withOpacity(0.3), height: 0.1),
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.termsAndConditionView);
                },
                title: "Add Terms & Conditions",
                icon: Icons.note_alt_outlined,
              ),
              Divider(color: AppColors.primaryGrey.withOpacity(0.3), height: 0.1),
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.contactUsView);
                },
                title: "Add Contact Us",
                icon: Icons.contact_mail_outlined,
              ),
              Divider(color: AppColors.primaryGrey.withOpacity(0.3), height: 0.1),
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.aboutUsView);
                },
                title: "Add About Us",
                icon: Icons.account_box_outlined,
              ),
              Divider(color: AppColors.primaryGrey.withOpacity(0.3), height: 0.1),
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.changePasswordView);
                },
                title: "Change Password",
                icon: Icons.lock_open,
              ),
              const Spacer(),
              ProfileListTileWidget(
                onPressed: () {
                  Utils.alertDialog("Are you sure to Log Out?", () {
                    authViewController.signOut();
                  });
                },
                title: "Log Out",
                icon: Icons.logout,
                isIconRequired: false,
              )
            ],
          ),
        ),
      );
    });
  }
}
