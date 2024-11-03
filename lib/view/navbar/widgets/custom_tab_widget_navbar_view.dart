import 'package:flutter/material.dart';

class CustomTabWidgetNavBarView extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final Color? color;
  const CustomTabWidgetNavBarView({super.key, this.onPressed, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        size: 27,
        icon,
        color: color,
      ),
    );
  }
}
