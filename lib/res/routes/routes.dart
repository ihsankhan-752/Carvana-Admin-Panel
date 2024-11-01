import 'package:carnava_admin_panel/res/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../view/splash/splash_view.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RoutesName.splashView,
        page: () => const SplashView(),
        transition: Transition.leftToRightWithFade,
      ),
      // GetPage(
      //   name: RoutesName.loginView,
      //   page: () => LoginView(),
      // ),
      // GetPage(
      //   name: RoutesName.signUpView,
      //   page: () => SignUpView(),
      // ),
      // GetPage(
      //   name: RoutesName.forgotPasswordView,
      //   page: () => ForgotPasswordView(),
      // ),
      // GetPage(
      //   name: RoutesName.firstOnboardingView,
      //   page: () => const FirstOnboardingView(),
      //   transition: Transition.rightToLeftWithFade,
      // ),
      // GetPage(
      //   name: RoutesName.secondOnboardingView,
      //   page: () => const SecondOnboardingView(),
      //   transition: Transition.rightToLeftWithFade,
      // ),
      // GetPage(
      //   name: RoutesName.thirdOnboardingView,
      //   page: () => const ThirdOnboardingView(),
      //   transition: Transition.rightToLeftWithFade,
      // ),
      // GetPage(
      //   name: RoutesName.congratulationMessageView,
      //   page: () => const CongratulationMessageView(),
      // ),
      // GetPage(
      //   name: RoutesName.navbarView,
      //   page: () => const CustomNavbarView(),
      // ),
      // GetPage(
      //   name: RoutesName.bookingView,
      //   page: () => const BookingView(),
      //   transition: Transition.rightToLeftWithFade,
      // ),
      // GetPage(
      //   name: RoutesName.checkOutView,
      //   page: () => const CheckOutView(),
      //   transition: Transition.rightToLeftWithFade,
      // ),
      // GetPage(
      //   name: RoutesName.homeDetailView,
      //   page: () => HomeDetailView(carModel: CarModel(carName: '', carImage: '')),
      //   transition: Transition.rightToLeftWithFade,
      // ),
    ];
  }
}
