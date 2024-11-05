import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  final String userId;
  final String carId;
  final String name;
  final String transmission;
  final String airConditioning;
  final String fuelType;
  final int doors;
  final int seats;
  final String imageUrl;
  final double pricePerHour;

  CarModel({
    required this.userId,
    required this.carId,
    required this.name,
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
        transmission: doc['transmission'],
        airConditioning: doc['airConditioning'],
        fuelType: doc['fuelType'],
        doors: doc['doors'],
        seats: doc['seats'],
        imageUrl: doc['imageUrl'],
        pricePerHour: doc['pricePerHour']);
  }
}
