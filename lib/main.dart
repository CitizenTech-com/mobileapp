import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/modules/splash_module/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CitizenTech());
}

class CitizenTech extends StatelessWidget {
  const CitizenTech({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: DefaultTheme().base,
      home: const SplashScreen(),
    );
  }
}
