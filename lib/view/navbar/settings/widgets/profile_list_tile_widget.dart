import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class ProfileListTileWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isIconRequired;
  const ProfileListTileWidget({super.key, this.title, this.icon, this.onPressed, this.isIconRequired = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: AppColors.primaryGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(icon, size: 20),
        ),
      ),
      title: Text(
        title!,
        style: AppTextStyles.h1.copyWith(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'normal'),
      ),
      trailing: isIconRequired
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: AppColors.primaryGrey,
            )
          : const SizedBox(),
    );
  }
}
