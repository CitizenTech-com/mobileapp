import 'package:Citizen.Tech/modules/authentication_module/repo/registration.repo.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final RxBool isTermsCheck = false.obs;
  final RegistrationRepository repo;
  final RxString userName = "".obs;
  final RxString email = "".obs;
  final RxString phone = "".obs;
  final RxString postCode = "".obs;
  final RxString address = "".obs;
  final RxString password = "".obs;
  final RxString confirmPassword = "".obs;
  RegistrationController({required this.repo});
}
