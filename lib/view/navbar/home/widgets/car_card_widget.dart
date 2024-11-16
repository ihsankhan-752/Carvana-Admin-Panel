import 'package:carnava_admin_panel/view/navbar/home/car_detail/car_detail_view.dart';
import 'package:carnava_admin_panel/view/navbar/home/widgets/car_shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../../../../models/car_model.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel car;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CarCardWidget({
    super.key,
    required this.car,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CarDetailView(carModel: car));
      },
      child: Card(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        color: AppColors.primaryWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withOpacity(0.2),
                  ),
                  child: PopupMenuButton<int>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.primaryBlack,
                      size: 24,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text("Edit"),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Delete"),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 0) {
                        onEdit();
                      } else if (value == 1) {
                        onDelete();
                      }
                    },
                  ),
                ),
              ),
              CarShimmerLoadingWidget(imageUrl: car.imageUrl),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(car.name, style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w900)),
                  Text(car.transmission, style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 13)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Icon(Icons.grade_outlined, size: 25, color: AppColors.golderColor),
                    const SizedBox(width: 5),
                    Text("4.8", style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(width: 3),
                    Text("(150)", style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 14)),
                    const Spacer(),
                    Text("\$ ${car.pricePerHour.toStringAsFixed(1)}/Day",
                        style: AppTextStyles.h1Bold
                            .copyWith(fontWeight: FontWeight.w900, fontSize: 14, color: AppColors.primaryColor)),
                  ],
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
