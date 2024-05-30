import 'package:Citizen.Tech/modules/authentication_module/signin/controller/login.controller.dart';
import 'package:Citizen.Tech/modules/authentication_module/signin/repo/login.repo.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(repo: LoginRepository()));
    // TODO: implement dependencies
  }
}