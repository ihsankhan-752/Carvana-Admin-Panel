import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:carnava_admin_panel/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCarServices {
  final CollectionReference carCollection = FirebaseFirestore.instance.collection('cars');

  Future<void> addCar(CarModel carModel, String id) async {
    try {
      await carCollection.doc(id).set(carModel.toMap());
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Stream<List<CarModel>> getAllCars() {
    return carCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((e) => CarModel.fromMap(e)).toList();
    });
  }
}
