import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:carnava_admin_panel/models/admin_model.dart';
import 'package:carnava_admin_panel/repository/auth/auth_repository.dart';
import 'package:carnava_admin_panel/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

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

  void clearTextInputs() {
    emailController.value.clear();
    usernameController.value.clear();
    passwordController.value.clear();
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
          image: "",
          email: email,
          password: password,
        );
        Get.toNamed(RoutesName.navbarView);
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

        Get.toNamed(RoutesName.navbarView);
      } catch (e) {
        isLoading.value = false;
      } finally {
        isLoading.value = false;
      }
    }
  }

  void fetchUserInformation(String userId) {
    try {
      _authRepo.getUser(userId).listen((AdminModel? user) {
        if (user != null) {
          adminModel.value = user;
        } else {
          Utils.toastMessage("Admin Not Found");
        }
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  Future<void> signOut() async {
    await _authRepo.signOut();
    Get.offNamed(RoutesName.loginView);
  }

  Future<void> changePassword({required String email, required String password, required String newPassword}) async {
    try {
      isLoading.value = true;
      bool checkPassword = await _authRepo.checkOldPassword(email, password);
      if (checkPassword) {
        await _authRepo.changeUserPassword(newPassword);
        Utils.toastMessage("Password Updated");
        Get.back();
      } else {
        Utils.toastMessage("Invalid Password");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
