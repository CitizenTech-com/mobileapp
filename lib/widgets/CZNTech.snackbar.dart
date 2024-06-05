import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/themes.dart';

void showCZNTechSnackBar(String message, {bool isError = true, bool getXSnackBar = false}) {
  if(message.isNotEmpty) {
    if(getXSnackBar) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        message: message,
        duration: Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(12),
        borderRadius: 5,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ));
    }else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.all(12),
        duration: Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Label(text: message,style: DefaultTheme().labelRegular,
          fontSize: 14,
        color: DefaultTheme().white,),
      ));
    }
  }
}