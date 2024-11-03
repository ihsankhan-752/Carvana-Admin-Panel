import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class SplashServices {
  void isUserLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      Timer(
        const Duration(seconds: 4),
        () {
          Get.toNamed(RoutesName.navbarView);
        },
      );
    } else {
      Timer(
        const Duration(seconds: 4),
        () {
          Get.toNamed(RoutesName.loginView);
        },
      );
    }
  }
}
