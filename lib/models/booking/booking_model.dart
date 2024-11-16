import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String userId;
  String sellerId;
  String carId;
  String bookingId;
  DateTime pickUpDate;
  double totalPrice;
  String pickUpTime;
  String returnTime;
  String paymentType;
  String bookingStatus;

  BookingModel({
    required this.userId,
    required this.sellerId,
    required this.carId,
    required this.bookingId,
    required this.pickUpDate,
    required this.totalPrice,
    required this.pickUpTime,
    required this.returnTime,
    required this.paymentType,
    required this.bookingStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'sellerId': sellerId,
      'carId': carId,
      'bookingId': bookingId,
      'pickUpDate': pickUpDate,
      'totalPrice': totalPrice,
      'pickUpTime': pickUpTime,
      'returnTime': returnTime,
      'paymentType': paymentType,
      'bookingStatus': bookingStatus,
    };
  }

  factory BookingModel.fromMap(DocumentSnapshot map) {
    return BookingModel(
      userId: map['userId'] as String,
      sellerId: map['sellerId'] as String,
      carId: map['carId'] as String,
      bookingId: map['bookingId'] as String,
      pickUpDate: (map['pickUpDate'] as Timestamp).toDate(),
      totalPrice: map['totalPrice'] as double,
      pickUpTime: map['pickUpTime'] as String,
      returnTime: map['returnTime'] as String,
      paymentType: map['paymentType'] as String,
      bookingStatus: map['bookingStatus'] as String,
    );
  }
}
