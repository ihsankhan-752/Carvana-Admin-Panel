import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  String userId;
  String carId;
  String name;
  String brand;
  String transmission;
  String airConditioning;
  String fuelType;
  int doors;
  int seats;
  String imageUrl;
  double pricePerHour;

  CarModel({
    required this.userId,
    required this.carId,
    required this.name,
    required this.brand,
    required this.transmission,
    required this.airConditioning,
    required this.fuelType,
    required this.doors,
    required this.seats,
    required this.imageUrl,
    required this.pricePerHour,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'carId': carId,
      'name': name,
      'brand': brand,
      'transmission': transmission,
      'airConditioning': airConditioning,
      'fuelType': fuelType,
      'doors': doors,
      'seats': seats,
      'imageUrl': imageUrl,
      'pricePerHour': pricePerHour,
    };
  }

  factory CarModel.fromMap(DocumentSnapshot doc) {
    return CarModel(
        userId: doc['userId'],
        carId: doc.id,
        name: doc['name'],
        brand: doc['brand'],
        transmission: doc['transmission'],
        airConditioning: doc['airConditioning'],
        fuelType: doc['fuelType'],
        doors: doc['doors'],
        seats: doc['seats'],
        imageUrl: doc['imageUrl'],
        pricePerHour: doc['pricePerHour']);
  }
}
