import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'modules/authentication_module/controller/login.controller.dart';

void main() {
  Get.put(LoginController());

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const CitizenTech());
  });
}

class CitizenTech extends StatelessWidget {
  const CitizenTech({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CitiExchange',
      theme: DefaultTheme().base,
      initialRoute: Routes.splash,
      getPages: getPages,
    );
  }
}
