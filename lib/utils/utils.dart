import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';
import '../res/text_styles/app_text_styles.dart';

class Utils {
  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.primaryColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static showSnackBar(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );
  }

  static alertDialog(String content, Function() onPress) {
    Get.defaultDialog(
      title: "Wait",
      content: Text(content),
      actions: [
        const Divider(),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("No", style: AppTextStyles.h1.copyWith(color: AppColors.primaryWhite, fontFamily: 'normal')),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPress,
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("Yes", style: AppTextStyles.h1.copyWith(color: AppColors.primaryWhite, fontFamily: 'normal')),
            ),
          ),
        )
      ],
    );
  }
}
