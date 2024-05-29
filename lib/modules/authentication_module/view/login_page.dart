import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/extensions/number.extensions.dart';
import 'package:Citizen.Tech/modules/authentication_module/controller/login.controller.dart';
import 'package:Citizen.Tech/utils/colors.dart';
import 'package:Citizen.Tech/utils/images.dart';
import 'package:Citizen.Tech/utils/routes.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/custom.button.dart';
import 'package:Citizen.Tech/widgets/custom.divider.dart';
import 'package:Citizen.Tech/widgets/text.fields.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultAppLayout(
      bgImage: Images.loginBg,
      child: SingleChildScrollView(
        child: Column(
          children: [
            60.verticalSpace(),
            const AppLogo(height: 86, width: 76),
            54.verticalSpace(),
            header(),
            60.verticalSpace(),
            userInputFields(controller),
            5.verticalSpace(),
            forgotPassword(),
            rememberMe(),
            loginButton(),
            signUp(),
            15.verticalSpace(),
            const CustomDivider(),
            15.verticalSpace(),
            loginWithText(),
            socialMediaButtons(),
          ],
        ),
      ),
    );
  }
}

header() {
  return Label(
    text: "Welcome Back! Please login to your account.",
    style: DefaultTheme().labelRegular,
    fontSize: 12,
    color: DefaultTheme().white,
  );
}

userInputFields(LoginController controller) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.11),
    child: Form(
      // key: loginController.formKey,
      child: Column(
        children: [
          InputTextField(
              hintText: "User Name",
              onChanged: (value) => controller.userName(value)),
          const SizedBox(
            height: 15,
          ),
          InputTextField(
              hintText: "Password",
              inputAction: TextInputAction.done,
              onChanged: (value) => controller.password(value)),
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
          value: false,
          onChanged: (bool? value) {},
          // onChanged: (value) {
          //   setState(() {
          //     isChecked = value!;
          //   });
          // },
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
          // Get.dialog(Text());
          // print(loginController.userName.text.trim());
          // print(loginController.password.text.trim());
          Get.toNamed(Routes.otp);
        },
        width: Get.width,
        text: "Log In",
        textStyle: DefaultTheme().labelSemiBold,
        fontSize: 14,
        color: DefaultTheme().gold,
        padding: 0.13,
      ),
      8.verticalSpace(),
      CustomButton(
          onPressed: () {
            Get.toNamed(Routes.registration);
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
                  Get.toNamed(Routes.registration);
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
