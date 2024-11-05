import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String username;
  final String email;
  final List favouriteCars;
  final String image;
  final String licenseImage;
  final String passportImage;
  final DateTime memberSince;

  const UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.favouriteCars,
    required this.image,
    required this.licenseImage,
    required this.passportImage,
    required this.memberSince,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'favouriteCars': favouriteCars,
      'image': image,
      'licenseImage': licenseImage,
      'passportImage': passportImage,
      'memberSince': memberSince,
    };
  }

  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      favouriteCars: map['favouriteCars'] as List,
      image: map['image'] as String,
      licenseImage: map['licenseImage'] as String,
      passportImage: map['passportImage'] as String,
      memberSince: (map['memberSince'] as Timestamp).toDate(),
    );
  }
}
