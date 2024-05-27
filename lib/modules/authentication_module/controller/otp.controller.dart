import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController controller;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    controller = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
