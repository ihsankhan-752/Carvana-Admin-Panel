import 'package:flutter/material.dart';

import '../../../../models/notification/notification_model.dart';
import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class NotificationCardWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationCardWidget({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          notificationModel.icon,
          color: notificationModel.notificationTitle == 'Approved' ? AppColors.primaryColor : AppColors.alertColor,
        ),
      ),
      title: Text(
        notificationModel.notificationTitle,
        style: AppTextStyles.h1Bold.copyWith(fontSize: 15),
      ),
      subtitle: Text(
        notificationModel.notificationDescription,
        style: AppTextStyles.h1.copyWith(
          fontSize: 13,
          color: AppColors.primaryBlack.withOpacity(0.7),
          fontFamily: 'normal',
        ),
      ),
    );
  }
}
