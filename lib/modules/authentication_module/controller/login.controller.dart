import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    userName = TextEditingController();
    password = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
