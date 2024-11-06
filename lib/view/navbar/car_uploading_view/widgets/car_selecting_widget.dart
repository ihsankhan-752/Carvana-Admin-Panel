import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/image_picking_widget.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class CarSelectingWidget extends StatelessWidget {
  CarSelectingWidget({super.key});
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await imageController.pickImage();
      },
      child: Obx(() {
        if (imageController.image.value == null) {
          return Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 2),
            ),
            child: const Center(child: Icon(Icons.add_a_photo_outlined)),
          );
        } else {
          if (imageController.loading.value) {
            return Center(
              child: Text(
                "Wait Bg Remove in progress",
                style: AppTextStyles.h1Bold.copyWith(
                  fontSize: 16,
                ),
              ),
            );
          } else {
            return Container(
              height: Get.height * 0.3,
              width: Get.width,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: MemoryImage(imageController.imageWithoutBg.value!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      imageController.clearUploadImage();
                    },
                    child: const Icon(Icons.delete, color: AppColors.alertColor),
                  ),
                ),
              ),
            );
          }
        }
      }),
    );
  }
}
