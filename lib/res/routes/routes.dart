import 'package:carnava_admin_panel/res/routes/routes_name.dart';
import 'package:carnava_admin_panel/view/navbar/navbar_view.dart';
import 'package:get/get.dart';

import '../../view/auth/forgot_password_view.dart';
import '../../view/auth/login_view.dart';
import '../../view/auth/signup_view.dart';
import '../../view/navbar/home/car_uploading_view/car_uploading_view.dart';
import '../../view/splash/splash_view.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RoutesName.splashView,
        page: () => const SplashView(),
        transition: Transition.leftToRightWithFade,
      ),
      GetPage(
        name: RoutesName.loginView,
        page: () => LoginView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.signUpView,
        page: () => SignUpView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.forgotPasswordView,
        page: () => ForgotPasswordView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.navbarView,
        page: () => const NavbarView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.carUploadingView,
        page: () => const CarUploadingView(),
        transition: Transition.rightToLeftWithFade,
      ),
    ];
  }
}
