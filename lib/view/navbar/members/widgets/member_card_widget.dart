import 'package:carnava_admin_panel/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/buttons/primary_button.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class MemberCardWidget extends StatelessWidget {
  final UserModel user;
  const MemberCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 08),
      child: Card(
        color: AppColors.primaryWhite,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          leading: CircleAvatar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            radius: 30,
            child: const Center(
              child: Icon(Icons.person, size: 30, color: AppColors.primaryBlack),
            ),
          ),
          title: Text(user.username, style: AppTextStyles.h1Bold.copyWith(fontSize: 18)),
          subtitle: Text(user.email, style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey)),
          trailing: const SizedBox(
            height: 40,
            width: 80,
            child: PrimaryButton(
              title: "Details",
            ),
          ),
        ),
      ),
    );
  }
}
