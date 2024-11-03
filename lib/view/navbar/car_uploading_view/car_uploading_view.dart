import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/car_uploading_view/widgets/car_name_text_input.dart';
import 'package:carnava_admin_panel/view/navbar/car_uploading_view/widgets/car_pricing_text_input.dart';
import 'package:carnava_admin_panel/view/navbar/car_uploading_view/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarUploadingView extends StatefulWidget {
  const CarUploadingView({super.key});

  @override
  State<CarUploadingView> createState() => _CarUploadingViewState();
}

class _CarUploadingViewState extends State<CarUploadingView> {
  String selectedCarBrand = 'Audi';
  String selectedTransmission = 'CVT';
  String selectedAirCondition = 'Yes';
  String selectedFuelType = 'Petrol';
  String selectedDoors = '4';
  String selectedSeats = '5';

  final List<String> carBrands = ['Audi', 'BMW', 'Ferrari', 'Ford', "Honda", "Jaguar", "Porsche", "Tesla"];
  final List<String> transmissionOptions = ['CVT', 'DCT', 'Manual', 'Automatic'];
  final List<String> airConditionOptions = ['Yes', 'No'];
  final List<String> fuelTypeOptions = ['Petrol', 'Diesel', 'Electric', 'Hybrid'];
  final List<String> doorsOptions = ['2', '4', '5'];
  final List<String> seatsOptions = ['2', '4', '5', '7', '8'];

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
                    child: Text("General Information",
                        style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Car Image",
                    style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryColor, width: 2),
                    ),
                    child: const Center(
                      child: Icon(Icons.add_a_photo_outlined),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomDropdown(
                    title: "Car Brand",
                    selectedValue: selectedCarBrand,
                    options: carBrands,
                    onChanged: (value) {
                      setState(() {
                        selectedCarBrand = value!;
                      });
                    },
                  ),
                  const CarNameTextInput(),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Center(
                    child:
                        Text("Car Features", style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor)),
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    title: "Air Conditioning",
                    selectedValue: selectedAirCondition,
                    options: airConditionOptions,
                    onChanged: (value) {
                      setState(() {
                        selectedAirCondition = value!;
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
                          selectedValue: selectedTransmission,
                          options: transmissionOptions,
                          onChanged: (value) {
                            setState(() {
                              selectedTransmission = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                        child: CustomDropdown(
                          title: "Fuel Type",
                          selectedValue: selectedFuelType,
                          options: fuelTypeOptions,
                          onChanged: (value) {
                            setState(() {
                              selectedFuelType = value!;
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
                          selectedValue: selectedDoors,
                          options: doorsOptions,
                          onChanged: (value) {
                            setState(() {
                              selectedDoors = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                        child: CustomDropdown(
                          title: "Seats",
                          selectedValue: selectedSeats,
                          options: seatsOptions,
                          onChanged: (value) {
                            setState(() {
                              selectedSeats = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Center(
                    child: Text("Pricing", style: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor)),
                  ),
                  const CarPricingTextInput(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15),
          child: PrimaryButton(
            title: "Save ",
          ),
        ));
  }
}
