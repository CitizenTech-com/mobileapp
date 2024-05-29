import 'package:Citizen.Tech/modules/authentication_module/repo/login.repo.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository repo;
  final RxString userName = "".obs;
  final RxString password = "".obs;
  LoginController({required this.repo});
}
