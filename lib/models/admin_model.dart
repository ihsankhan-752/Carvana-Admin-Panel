import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String userId;
  final String username;
  final String email;
  final DateTime memberSince;

  const AdminModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.memberSince,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'memberSince': memberSince,
    };
  }

  factory AdminModel.fromMap(DocumentSnapshot map) {
    return AdminModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      memberSince: (map['memberSince'] as Timestamp).toDate(),
    );
  }
}
