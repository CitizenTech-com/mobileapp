import 'dart:convert';
import 'package:Citizen.Tech/models/post.code.json.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/repo/registration.repo.dart';
import 'package:Citizen.Tech/widgets/CZNTech.snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  late var postCodeJson =
      PostCodeJson(city: "", postcode: "", addresses: []).obs;
  final formKey = GlobalKey<FormState>();
  final RxBool isTermsCheck = false.obs;
  final RegistrationRepository repo;
  final RxString firstName = "".obs;
  final RxString email = "".obs;
  final RxString phone = "".obs;
  final RxString postCode = "".obs;
  final RxString address = "".obs;
  final RxString password = "".obs;
  final RxString confirmPassword = "".obs;
  final RxString countryCode = "+44".obs;

  RegistrationController({required this.repo});

  @override
  void onInit() async {
    getPostCode();
    super.onInit();
  }

  getPostCode() async {
    await repo.getPostCodes().then((response) {
      postCodeJson.value = PostCodeJson.fromJson(jsonDecode(response!.data));
    });
  }

  register() async {
    var data = {
      "fullName": firstName.value,
      "phone": phone.value,
      "address": "Edward Street",
      "postCode": "S3 7GE",
      "email": email.value,
      "password": password.value,
      "confirmPassword": confirmPassword.value,
    };
    await repo.registerUser(data).then((response) {
      if(response!.statusCode==201){
        var res = jsonDecode(response.data);
        if(res["success"]==true){
          showCZNTechSnackBar("Register successful!");
        }else{
          showCZNTechSnackBar("Register failed!");
        }
      }
    });
  }
}
