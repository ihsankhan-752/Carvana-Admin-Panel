import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:carnava_admin_panel/view/navbar/settings/edit_profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class AdminInformationWidget extends StatelessWidget {
  final AdminModel admin;
  const AdminInformationWidget({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: admin.image == ""
          ? Container(
              width: Get.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryBlack),
              ),
              child: const Center(
                child: Icon(Icons.person, size: 40, color: AppColors.primaryColor),
              ),
            )
          : Container(
              width: Get.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(admin.image)),
              ),
            ),
      title: Text(admin.username, style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w900, fontSize: 20)),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 05),
        child: Text(
          "Since: ${DateFormat('dd-MM-yyyy').format(admin.memberSince)}",
          style: AppTextStyles.h1.copyWith(fontSize: 13, color: AppColors.primaryColor),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Get.to(() => EditProfileView(adminModel: admin));
        },
        child: SizedBox(
          width: 50,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.primaryColor, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.edit, size: 15, color: AppColors.primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
