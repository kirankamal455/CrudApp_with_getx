import 'package:crud_app_flutter/app/modules/home/home_binding.dart';
import 'package:crud_app_flutter/app/modules/home/home_page.dart';
import 'package:crud_app_flutter/app/modules/login/login_binding.dart';
import 'package:crud_app_flutter/app/modules/login/login_page.dart';
import 'package:crud_app_flutter/app/modules/signup/signup_binding.dart';
import 'package:crud_app_flutter/app/modules/signup/signup_page.dart';
import 'package:crud_app_flutter/app/modules/splash/splash_biniding.dart';
import 'package:crud_app_flutter/app/modules/splash/splash_page.dart';
import 'package:crud_app_flutter/app/routes/app_pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpScreen(),
        binding: SignUpBinding()),
  ];
}
