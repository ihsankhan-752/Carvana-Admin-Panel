import 'package:carnava_admin_panel/view/navbar/home/widgets/car_image_widget_in_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/car_model.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/components/buttons/primary_button.dart';
import '../../../res/components/image_picking_widget.dart';
import '../../../res/text_styles/app_text_styles.dart';
import '../../../view_model/controllers/car/car_view_controller.dart';
import '../car_uploading_view/widgets/car_name_text_input.dart';
import '../car_uploading_view/widgets/car_pricing_text_input.dart';
import '../car_uploading_view/widgets/custom_dropdown_widget.dart';

class EditCarView extends StatefulWidget {
  final CarModel carModel;
  const EditCarView({super.key, required this.carModel});

  @override
  State<EditCarView> createState() => _EditCarViewState();
}

class _EditCarViewState extends State<EditCarView> {
  final ImageController imageController = Get.put(ImageController());
  final CarViewController carController = Get.put(CarViewController());

  @override
  void initState() {
    super.initState();
    carController.carNameController.value.text = widget.carModel.name;

    carController.selectedCarBrand.value = widget.carModel.brand;
    carController.selectedAirCondition.value = widget.carModel.airConditioning;
    carController.selectedTransmission.value = widget.carModel.transmission;
    carController.selectedFuelType.value = widget.carModel.fuelType;
    carController.selectedDoors.value = widget.carModel.doors;
    carController.selectedSeats.value = widget.carModel.seats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text(widget.carModel.name, style: AppTextStyles.h1Bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarImageWidgetInEditView(carModel: widget.carModel),
              const SizedBox(height: 10),

              CustomDropdown(
                title: "Car Brand",
                selectedValue: carController.selectedCarBrand.value,
                options: carController.carBrands,
                onChanged: (value) {
                  carController.selectedCarBrand.value = value!;
                },
              ),

              CarNameTextInput(
                hintText: "Enter car name",
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
                  carController.selectedAirCondition.value = value!;
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
                        carController.selectedTransmission.value = value!;
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
                        carController.selectedFuelType.value = value!;
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
                        carController.selectedSeats.value = int.parse(value!);
                      },
                    ),
                  ),
                ],
              ),

              // Pricing Section
              const Divider(),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Pricing",
                  style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor),
                ),
              ),
              CarPricingTextInput(
                hintText: "${widget.carModel.pricePerHour.toStringAsFixed(1)} \$",
                controller: carController.pricePerHourController.value,
              ),
              const SizedBox(height: 20),
            ],
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
                      carController.updateCar(
                        carId: widget.carModel.carId,
                        name: carController.carNameController.value.text.isNotEmpty
                            ? carController.carNameController.value.text
                            : widget.carModel.name,
                        image: imageController.imageWithoutBg.value,
                        brand: carController.selectedCarBrand.value,
                        airConditioning: carController.selectedAirCondition.value,
                        transmission: carController.selectedTransmission.value,
                        fuelType: carController.selectedFuelType.value,
                        doors: carController.selectedDoors.value,
                        seats: carController.selectedSeats.value,
                        pricePerHour:
                            double.tryParse(carController.pricePerHourController.value.text) ?? widget.carModel.pricePerHour,
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
