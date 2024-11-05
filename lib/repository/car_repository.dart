import 'package:carnava_admin_panel/data/services/firestore_car_services.dart';
import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarRepository {
  final FireStoreCarServices _carServices = FireStoreCarServices();

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addCar(CarModel carModel, String id) async {
    await _carServices.addCar(carModel, id);
  }

  Stream<List<CarModel>> getAllCars() {
    return _fireStore.collection('cars').snapshots().map((snapshot) {
      return snapshot.docs.map((e) => CarModel.fromMap(e)).toList();
    });
  }
}
