import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:carnava_admin_panel/repository/car_repository.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../repository/storage_repository.dart';

class CarViewController extends GetxController {
  final CarRepository _carRepository = CarRepository();
  final StorageRepository storageRepository = StorageRepository();

  final carNameController = TextEditingController().obs;
  final pricePerHourController = TextEditingController().obs;
  RxBool isInitialLoad = true.obs;

  Rx<Stream<List<CarModel>>> carStream = Rx<Stream<List<CarModel>>>(const Stream.empty());

  @override
  void onInit() {
    super.onInit();
    carStream.value = _carRepository.getAllCars();
  }

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
    required Uint8List image,
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
          userId: FirebaseAuth.instance.currentUser!.uid,
          carId: carId,
          name: name,
          transmission: transmission,
          airConditioning: airConditioning,
          fuelType: fuelType,
          doors: doors,
          seats: seats,
          imageUrl: imageUrl,
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

  Future<void> deleteCar(String carId) async {
    await _carRepository.deleteCar(carId);
  }
}
