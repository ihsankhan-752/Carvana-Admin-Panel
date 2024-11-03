import 'dart:io';

import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:carnava_admin_panel/repository/car_repository.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../repository/storage_repository.dart';

class CarViewController extends GetxController {
  final CarRepository _carRepository = CarRepository();
  final StorageRepository storageRepository = StorageRepository();

  final carNameController = TextEditingController().obs;
  final pricePerHourController = TextEditingController().obs;

  RxString selectedCarBrand = 'Audi'.obs;
  RxString selectedTransmission = 'CVT'.obs;
  RxString selectedAirCondition = 'Yes'.obs;
  RxString selectedFuelType = 'Petrol'.obs;
  RxInt selectedDoors = 4.obs;
  RxInt selectedSeats = 5.obs;

  RxList<String> carBrands = ['Audi', 'BMW', 'Ferrari', 'Ford', "Honda", "Jaguar", "Porsche", "Tesla"].obs;
  RxList<String> transmissionOptions = ['CVT', 'DCT', 'Manual', 'Automatic'].obs;
  RxList<String> airConditionOptions = ['Yes', 'No'].obs;
  RxList<String> fuelTypeOptions = ['Petrol', 'Diesel', 'Electric', 'Hybrid'].obs;
  RxList<int> doorsOptions = [2, 4, 5].obs;
  RxList<int> seatsOptions = [2, 4, 5, 7, 8].obs;
  RxBool isLoading = false.obs;

  Future<void> uploadCar({
    required String name,
    required File image,
    required String brand,
    required String airConditioning,
    required String transmission,
    required String fuelType,
    required int doors,
    required int seats,
    double? pricePerHour,
  }) async {
    if (name.isEmpty) {
      Utils.centerToastMessage("Car Name required");
      return;
    } else if (pricePerHour == null) {
      Utils.centerToastMessage("Price per hour required");
      return;
    }

    try {
      isLoading.value = true;
      var carId = const Uuid().v4();

      String? imageUrl = await storageRepository.uploadImage(image);
      if (imageUrl != null) {
        CarModel carModel = CarModel(
          carId: carId,
          name: name,
          transmission: transmission,
          airConditioning: airConditioning,
          fuelType: fuelType,
          doors: doors,
          seats: seats,
          imageUrl: imageUrl!,
          pricePerHour: pricePerHour,
        );

        await _carRepository.addCar(carModel, carId);
        Utils.toastMessage("Car Information Uploaded");
        Get.back();
      } else {
        Utils.toastMessage("Image required");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
