import 'package:Citizen.Tech/modules/authentication_module/controller/login.controller.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/otp_screen.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/registration_screen.dart';
import 'package:Citizen.Tech/widgets/app.background.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/text.fields.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/themes.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../widgets/custom.button.dart';
import '../../../widgets/custom.divider.dart';
import '../../../widgets/space.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  late LoginController loginController;

  @override
  void initState() {
    loginController = Get.put(LoginController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      image: Images.loginBg,
      child: DefaultAppLayout(
        child: ColorfulSafeArea(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Space().setVertical(0.05),
                const AppLogo(height: 86, width: 76),
                Space().setVertical(0.05),
                header(),
                Space().setVertical(0.06),
                userInputFields(),
                const SizedBox(
                  height: 5,
                ),
                forgotPassword(),
                rememberMe(),
                loginButton(),
                signUp(),
                const SizedBox(
                  height: 15,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 15,
                ),
                loginWithText(),
                Space().setVertical(0.03),
                socialMediaButtons(),
                Space().setVertical(0.12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  header() {
    return Label(
      text: "Welcome Back! Please login to your account.",
      style: DefaultTheme().labelRegular,
      fontSize: 12,
      color: DefaultTheme().white,
    );
  }

  userInputFields() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.11),
      child: Form(
        key: loginController.formKey,
        child: Column(
          children: [
            InputTextField(
              controller: loginController.userName,
              hintText: "User Name",
            ),
            const SizedBox(
              height: 15,
            ),
            InputTextField(
              controller: loginController.password,
              hintText: "Password",
              inputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  forgotPassword() {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.only(right: Get.width * 0.11),
        child: InkWell(
            onTap: () {},
            child: Label(
              text: "Forgot Password",
              textAlign: TextAlign.right,
              fontSize: 12,
              style: DefaultTheme().labelRegular,
              color: DefaultTheme().white,
            )),
      ),
    );
  }

  rememberMe() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: MyColors.black,
            activeColor: MyColors.white,
            side: const BorderSide(
              color: MyColors.white,
              width: 1.5,
            ),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Flexible(
            child: Label(
              text: "Remember Me",
              fontSize: 12,
              style: DefaultTheme().labelRegular,
              color: DefaultTheme().white,
            ),
          ),
        ],
      ),
    );
  }

  loginButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          onPressed: () {
            Get.to(const OtpScreen());
          },
          width: Get.width,
          text: "Log In",
          textStyle: DefaultTheme().labelSemiBold,
          fontSize: 14,
          color: DefaultTheme().gold,
          padding: 0.13,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomButton(
            onPressed: () {
              Get.to(const RegistrationScreen());
            },
            width: Get.width,
            text: "Cancel",
            textStyle: DefaultTheme()
                .labelSemiBold
                .copyWith(color: DefaultTheme().white),
            fontSize: 14,
            textColor: DefaultTheme().white,
            color: DefaultTheme().gold,
            padding: 0.13,
            isBorder: true,
            isTransparent: true),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  signUp() {
    return RichText(
      text: TextSpan(
          text: 'New User? ',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          )),
          children: <TextSpan>[
            TextSpan(
                text: ' Sign Up',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(const RegistrationScreen());
                    // navigate to desired screen
                  })
          ]),
    );
  }

  loginWithText() {
    return Label(
      text: "Login with",
      style: DefaultTheme().labelRegular,
      fontSize: 12,
      color: DefaultTheme().white,
    );
  }

  socialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Images.google),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Image.asset(Images.facebook),
        ),
        Image.asset(Images.lindedin)
      ],
    );
  }
}
