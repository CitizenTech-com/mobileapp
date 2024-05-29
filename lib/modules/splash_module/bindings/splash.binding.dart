import 'package:Citizen.Tech/modules/splash_module/controller/splash.controller.dart';
import 'package:Citizen.Tech/modules/splash_module/repo/splash.repo.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(repo: SplashRepository()));
  }
}
