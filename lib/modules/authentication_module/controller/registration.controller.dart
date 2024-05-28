import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  late GlobalKey<FormState> formKey;
  final RxString userName = "".obs;
  final RxString email = "".obs;
  final RxString phone = "".obs;
  final RxString postCode = "".obs;
  final RxString address = "".obs;
  final RxString password = "".obs;
  final RxString confirmPassword = "".obs;
}
