import 'package:Citizen.Tech/modules/authentication_module/bindings/login.binding.dart';
import 'package:Citizen.Tech/modules/authentication_module/bindings/registration.binding.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/login_page.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/otp_page.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/registration_page.dart';
import 'package:Citizen.Tech/modules/splash_module/bindings/splash.binding.dart';
import 'package:get/get.dart';
import '../modules/splash_module/view/splash.view.dart';

class Routes {
  static String splash = '/splash';
  static String login = '/login';
  static String registration = '/registration';
  static String otp = '/otp';
}

final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => SplashPage(),
    binding: SplashBinding()
  ),
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
    binding: LoginBinding()
  ),
  GetPage(
    name: Routes.registration,
    page: () => RegistrationPage(),
    binding: RegistrationBinding()
  ),
  GetPage(
    name: Routes.otp,
    page: () => OTPPage(),
  ),
];
