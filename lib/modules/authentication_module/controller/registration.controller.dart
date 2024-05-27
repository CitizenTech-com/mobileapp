import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController postCode;
  late TextEditingController address;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    postCode = TextEditingController();
    address = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
