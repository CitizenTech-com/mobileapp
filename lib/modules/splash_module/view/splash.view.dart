// ignore_for_file: unnecessary_null_comparison

import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/extensions/number.extensions.dart';
import 'package:Citizen.Tech/extensions/widget.extensions.dart';
import 'package:Citizen.Tech/modules/splash_module/controller/splash.controller.dart';
import 'package:Citizen.Tech/utils/colors.dart';
import 'package:Citizen.Tech/utils/images.dart';
import 'package:Citizen.Tech/utils/routes.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/custom.button.dart';
import 'package:Citizen.Tech/widgets/empty.widget.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAppLayout(
        bgImage: Images.splashBg,
        child: Obx(() => controller.deviceLocation == null
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  145.verticalSpace(),
                  const AppLogo(height: 172, width: 154),
                  130.verticalSpace(),
                  Label(
                    text: "Lorem ipsum dolor sit \n      Let’s help you!",
                    style: DefaultTheme().labelBold,
                    fontSize: 22,
                    color: DefaultTheme().white,
                  ),
                  19.verticalSpace(),
                  communityButton(),
                  25.verticalSpace(),
                  alreadyUser()
                ],
              )));
  }

  communityButton() {
    return CustomButton(
      onPressed: () {
        Get.toNamed(Routes.registration);
      },
      width: Get.width,
      height: 58,
      text: "Join our community",
      textStyle: DefaultTheme().labelBold,
      fontSize: 17,
      color: DefaultTheme().gold,
    );
  }

  alreadyUser() {
    return RichText(
      text: TextSpan(
          text: 'Already a member?',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            color: MyColors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          )),
          children: <TextSpan>[
            TextSpan(
                text: ' Sign in',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: MyColors.gold,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.login);
                    // navigate to desired screen
                  })
          ]),
    );
  }
}
