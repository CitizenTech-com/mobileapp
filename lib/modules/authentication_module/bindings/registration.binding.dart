import 'package:Citizen.Tech/modules/authentication_module/controller/registration.controller.dart';
import 'package:Citizen.Tech/modules/authentication_module/repo/registration.repo.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationController(repo: RegistrationRepository()));
    // TODO: implement dependencies
  }
}
