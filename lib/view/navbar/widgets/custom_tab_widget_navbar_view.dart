import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTabWidgetNavBarView extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final Color? color;
  final String? title;
  const CustomTabWidgetNavBarView({super.key, this.onPressed, required this.icon, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 27,
            icon,
            color: color,
          ),
          const SizedBox(height: 2),
          Text(
            title!,
            style: AppTextStyles.h1.copyWith(
              fontSize: 13,
              color: color,
              fontFamily: 'normal',
            ),
          ),
        ],
      ),
    );
  }
}
