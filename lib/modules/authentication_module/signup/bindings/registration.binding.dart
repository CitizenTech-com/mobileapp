import 'package:Citizen.Tech/modules/authentication_module/signup/controller/registration.controller.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/repo/registration.repo.dart';
import 'package:Citizen.Tech/providers/api.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationController(repo: RegistrationRepository(apiClient: ApiClient())));
    // TODO: implement dependencies
  }
}
