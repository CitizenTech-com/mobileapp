import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/login_screen.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/registration_screen.dart';
import 'package:Citizen.Tech/modules/splash_module/controller/splash.controller.dart';
import 'package:Citizen.Tech/utils/colors.dart';
import 'package:Citizen.Tech/utils/images.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/custom.button.dart';
import 'package:Citizen.Tech/widgets/space.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Get.put(SplashController());
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(Images.splashBg)),
      ),
      child: DefaultAppLayout(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space().setVertical(0.19),
          const AppLogo(height: 172, width: 154),
          Space().setVertical(0.16),
          Label(
            text: "Lorem ipsum dolor sit \n      Let’s help you!",
            style: DefaultTheme().labelBold,
            fontSize: 22,
            color: DefaultTheme().white,
          ),
          Space().setVertical(0.03),
          communityButton(),
          Space().setVertical(0.04),
          alreadyUser()
        ],
      )),
    );
  }

  communityButton() {
    return CustomButton(
      onPressed: () {
        Get.to(const RegistrationScreen());
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
                    Get.to(const LoginScreen());
                    // navigate to desired screen
                  })
          ]),
    );
  }
}
