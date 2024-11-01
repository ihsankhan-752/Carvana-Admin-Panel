import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;

  RxBool isPassVisible = true.obs;

  void setPasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }
}
