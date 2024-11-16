import 'package:carnava_admin_panel/view/navbar/notification/widgets/notification_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../res/lists/lists.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          return NotificationCardWidget(notificationModel: notificationList[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(endIndent: 10, indent: 10);
        },
      ),
    );
  }
}
