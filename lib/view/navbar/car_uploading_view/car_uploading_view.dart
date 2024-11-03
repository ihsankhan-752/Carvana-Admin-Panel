import 'dart:io';

import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/car_uploading_view/widgets/car_name_text_input.dart';
import 'package:carnava_admin_panel/view/navbar/car_uploading_view/widgets/car_pricing_text_input.dart';
import 'package:carnava_admin_panel/view/navbar/car_uploading_view/widgets/custom_dropdown_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/car_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controllers/image_controller.dart';

class CarUploadingView extends StatefulWidget {
  const CarUploadingView({super.key});

  @override
  State<CarUploadingView> createState() => _CarUploadingViewState();
}

class _CarUploadingViewState extends State<CarUploadingView> {
  CarViewController carController = Get.put(CarViewController());
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "General Information",
                    style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Car Image",
                  style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () async {
                    await imageController.pickImage();
                    // Add this debug print to see if the image is picked
                    print("Picked Image Path: ${imageController.image.value?.path}");
                  },
                  child: Obx(() {
                    return Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor, width: 2),
                        image: imageController.image.value != null
                            ? DecorationImage(
                                image: FileImage(File(imageController.image.value!.path)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: imageController.image.value == null ? const Center(child: Icon(Icons.add_a_photo_outlined)) : null,
                    );
                  }),
                ),
                const SizedBox(height: 20),
                CustomDropdown(
                  title: "Car Brand",
                  selectedValue: carController.selectedCarBrand.value,
                  options: carController.carBrands,
                  onChanged: (value) {
                    setState(() {
                      carController.selectedCarBrand.value = value!;
                    });
                  },
                ),
                CarNameTextInput(
                  controller: carController.carNameController.value,
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Car Features",
                    style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(height: 10),
                CustomDropdown(
                  title: "Air Conditioning",
                  selectedValue: carController.selectedAirCondition.value,
                  options: carController.airConditionOptions,
                  onChanged: (value) {
                    setState(() {
                      carController.selectedAirCondition.value = value!;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomDropdown(
                        title: "Transmission",
                        selectedValue: carController.selectedTransmission.value,
                        options: carController.transmissionOptions,
                        onChanged: (value) {
                          setState(() {
                            carController.selectedTransmission.value = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomDropdown(
                        title: "Fuel Type",
                        selectedValue: carController.selectedFuelType.value,
                        options: carController.fuelTypeOptions,
                        onChanged: (value) {
                          setState(() {
                            carController.selectedFuelType.value = value!;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomDropdown(
                        title: "Doors",
                        selectedValue: carController.selectedDoors.value.toString(),
                        options: carController.doorsOptions.map((door) => door.toString()).toList(),
                        onChanged: (value) {
                          carController.selectedDoors.value = int.parse(value!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomDropdown(
                        title: "Seats",
                        selectedValue: carController.selectedSeats.value.toString(),
                        options: carController.seatsOptions.map((seat) => seat.toString()).toList(),
                        onChanged: (value) {
                          setState(() {
                            carController.selectedSeats.value = int.parse(value!);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Pricing",
                    style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor),
                  ),
                ),
                CarPricingTextInput(
                  controller: carController.pricePerHourController.value,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: carController.isLoading.value
                ? SizedBox(
                    height: 60,
                    width: Get.width,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : PrimaryButton(
                    onPressed: () {
                      print("Uploading Car Details:");
                      print("Car Name: ${carController.carNameController.value.text}");
                      print("Selected Brand: ${carController.selectedCarBrand.value}");
                      print("Image: ${imageController.image.value?.path}");
                      print("Price Per Hour: ${carController.pricePerHourController.value.text}");

                      carController.uploadCar(
                        name: carController.carNameController.value.text,
                        image: imageController.image.value!,
                        brand: carController.selectedCarBrand.value,
                        airConditioning: carController.selectedAirCondition.value,
                        transmission: carController.selectedTransmission.value,
                        fuelType: carController.selectedFuelType.value,
                        doors: carController.selectedDoors.value,
                        seats: carController.selectedSeats.value,
                        pricePerHour: double.tryParse(carController.pricePerHourController.value.text),
                      );
                    },
                    title: "Save",
                  ),
          );
        },
      ),
    );
  }
}
