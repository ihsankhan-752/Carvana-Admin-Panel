import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/image_picking_widget.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class CarImageWidgetInEditView extends StatelessWidget {
  final CarModel carModel;
  CarImageWidgetInEditView({super.key, required this.carModel});

  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await imageController.pickCarImage();
      },
      child: Obx(() {
        if (imageController.image.value == null) {
          return Container(
            height: Get.height * 0.25,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryColor),
              image: DecorationImage(
                image: NetworkImage(carModel.imageUrl),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(0.1),
                ),
                child: const Center(
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ),
          );
        } else {
          if (imageController.loading.value) {
            return Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Center(
                child: Text(
                  "Wait Bg Remove in progress",
                  style: AppTextStyles.h1Bold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            );
          } else {
            return Container(
              height: Get.height * 0.25,
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
