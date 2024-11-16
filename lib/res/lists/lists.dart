import 'package:flutter/material.dart';

import '../../models/notification/notification_model.dart';

List<NotificationModel> notificationList = [
  const NotificationModel(
    notificationTitle: 'Approved',
    notificationDescription: 'Your booking is approved',
    icon: Icons.check_circle_outline,
  ),
  const NotificationModel(
    notificationTitle: 'Reject',
    notificationDescription: 'Your booking is rejected',
    icon: Icons.cancel_outlined,
  ),
  const NotificationModel(
    notificationTitle: 'Approved',
    notificationDescription: 'Your booking is approved',
    icon: Icons.check_circle_outline,
  ),
  const NotificationModel(
    notificationTitle: 'rejected',
    notificationDescription: 'Your booking is rejected',
    icon: Icons.cancel_outlined,
  ),
];
