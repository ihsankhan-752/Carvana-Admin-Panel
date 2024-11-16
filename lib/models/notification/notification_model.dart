import 'package:flutter/material.dart';

class NotificationModel {
  final String notificationTitle;
  final String notificationDescription;
  final IconData icon;

  const NotificationModel({
    required this.notificationTitle,
    required this.notificationDescription,
    required this.icon,
  });
}
