import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';

class CustomPopupMenuWidget extends StatelessWidget {
  final Function(int v)? onSelected;
  const CustomPopupMenuWidget({super.key, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor.withOpacity(0.2),
      ),
      child: PopupMenuButton<int>(
        icon: const Icon(
          Icons.more_vert,
          color: AppColors.primaryBlack,
          size: 20,
        ),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 0,
            child: Text("Approve"),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text("Cancel"),
          ),
        ],
        onSelected: onSelected,
      ),
    );
  }
}
