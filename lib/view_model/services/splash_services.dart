import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class SplashServices {
  void isUserLogin() {
    Timer(Duration(seconds: 4), () {
      Get.toNamed(RoutesName.loginView);
    });

    // if (FirebaseAuth.instance.currentUser != null) {
    //   Timer(
    //     const Duration(seconds: 4),
    //     () {
    //       Get.toNamed(RoutesName.navbarView);
    //     },
    //   );
    // } else {
    //   Timer(
    //     const Duration(seconds: 4),
    //     () {
    //       Get.toNamed(RoutesName.firstOnboardingView);
    //     },
    //   );
    // }
  }
}
