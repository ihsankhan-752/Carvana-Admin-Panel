import 'package:carnava_admin_panel/data/services/car/firestore_car_services.dart';
import 'package:carnava_admin_panel/models/car_model.dart';

class CarRepository {
  final FireStoreCarServices _carServices = FireStoreCarServices();

  Future<void> addCar(CarModel carModel, String id) async {
    await _carServices.addCar(carModel, id);
  }

  Stream<List<CarModel>> getAllCars() {
    return _carServices.getAllCars();
  }

  Future<void> deleteCar(String carId) async {
    await _carServices.deleteCar(carId);
  }
}
