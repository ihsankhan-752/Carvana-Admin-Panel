import 'dart:async';

class SplashServices {
  void isUserLogin() {
    Timer(Duration(seconds: 4), () {});

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
