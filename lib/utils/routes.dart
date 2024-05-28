import 'package:Citizen.Tech/modules/authentication_module/view/login_page.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/otp_page.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/registration_page.dart';
import 'package:get/get.dart';
import '../modules/splash_module/view/splash_page.dart';

class Routes {
  static String splash = '/splash';
  static String login = '/login';
  static String registration = '/registration';
  static String otp = '/otp';

}

final getPages = [
  GetPage(
    name: Routes.splash,
    page: () =>  SplashPage(),
  ),
  GetPage(
    name: Routes.login,
    page: () =>  LoginPage(),
  ),
  GetPage(
    name: Routes.registration,
    page: () =>  RegistrationPage(),
  ),

  GetPage(
    name: Routes.otp,
    page: () =>  OTPPage(),
  ),
];