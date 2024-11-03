import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:carnava_admin_panel/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class AuthViewController extends GetxController {
  final _authRepo = AuthRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;

  RxBool isPassVisible = true.obs;
  RxBool isLoading = false.obs;
  Rx<AdminModel?> adminModel = Rx<AdminModel?>(null);

  void setPasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }

  Future<void> signUpUser({required String username, required String email, required String password}) async {
    if (username.isEmpty) {
      Utils.toastMessage('username required');
    } else if (email.isEmpty) {
      Utils.toastMessage('Email required');
    } else if (password.isEmpty) {
      Utils.toastMessage('Password required');
    } else {
      try {
        isLoading.value = true;
        await _authRepo.signUpUser(
          username: username,
          email: email,
          password: password,
        );
        //ToDo Going  to home
      } catch (e) {
        Utils.toastMessage(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signInUser(String email, String password) async {
    if (email.isEmpty) {
      Utils.toastMessage("Email required");
    } else if (password.isEmpty) {
      Utils.toastMessage('Password required');
    } else {
      try {
        isLoading.value = true;
        await _authRepo.signInUser(email, password);

        //ToDo Going to HOme Page
      } catch (e) {
        isLoading.value = false;
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> fetchUserInformation(String userId) async {
    try {
      AdminModel? user = await _authRepo.getUser(userId);
      if (user != null) {
        adminModel.value = user;
      } else {
        Utils.toastMessage("User Not Fount");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }
}
