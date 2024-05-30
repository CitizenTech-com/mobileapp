import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/extensions/number.extensions.dart';
import 'package:Citizen.Tech/modules/authentication_module/controller/registration.controller.dart';
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

class RegistrationPage extends GetView<RegistrationController> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAppLayout(
        bgImage: Images.splashBg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              60.verticalSpace(),
              header(),
              40.verticalSpace(),
              userInputFields(),
              28.verticalSpace(),
              termsCondition(),
              15.verticalSpace(),
              signUpButton(),
              20.verticalSpace(),
              alreadyHaveAccount(),
              15.verticalSpace(),
              const CustomDivider(),
              15.verticalSpace(),
              loginWithText(),
              40.verticalSpace(),
              socialMediaButtons(),
              80.verticalSpace(),
            ],
          ),
        ));
  }

  header() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(height: 70, width: 0),
          Label(
            text: "Join Us",
            style: DefaultTheme().labelRegular,
            fontSize: 32,
            color: DefaultTheme().white,
          ),
        ],
      ),
    );
  }

  userInputFields() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(left: Get.width * 0.11, right: Get.width * 0.11),
      child: Form(
        child: Column(
          children: [
            InputTextField(
                hintText: "Full Name",
                onChanged: (value) => controller.userName(value),
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Email",
                onChanged: (value) => controller.email(value),
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Phone",
                onChanged: (value) => controller.phone(value),
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Post Code",
                onChanged: (value) => controller.postCode(value),
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Address",
                onChanged: (value) => controller.address(value),
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Password",
                onChanged: (value) => controller.password(value),
                isBorder: true,),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Confirm Password",
                onChanged: (value) => controller.confirmPassword(value),
                isBorder: true,),
          ],
        ),
      ),
    );
  }

  termsCondition() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => Checkbox(
                checkColor: MyColors.black,
                activeColor: MyColors.white,
                side: const BorderSide(
                  color: MyColors.white,
                  width: 1.5,
                ),
                value: controller.isTermsCheck.value,
                onChanged: (bool? value) {
                  controller.isTermsCheck(value);
                },
              )),
          Flexible(
            child: RichText(
              text: TextSpan(
                  text: 'I agree to all Term, ',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  )),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Privacy Policy',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.underline)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openTermsSection();
                            // navigate to desired screen
                          }),
                    TextSpan(
                      text: ' and Fees.',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                      // navigate to desired screen
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  openTermsSection() {
    return Get.bottomSheet(
      backgroundColor: MyColors.white,
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Terms & Conditions",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: MyColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ))),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
                "A mobile app's Terms and Conditions agreement (T&C) is where you set out the rules and restrictions for anyone who uses your mobile app. It helps limit your legal liability while managing user expectations. \nWhile not legally required like Privacy Policy is, this agreement comes with a number of priceless business benefits that you won't want to miss out on. \nThis article will get you started with writing your own custom Terms and Conditions agreement for a mobile app, regardless if it's for Apple iOS or Google Android. \nWe've also put together a Sample Mobile App Terms and Conditions Template that you can use to help write your own."),
          ),
        ],
      ),
    );
  }

  signUpButton() {
    return CustomButton(
      onPressed: () {
        // Get.toNamed(Routes.registration);
      },
      width: Get.width,
      text: "Sign up",
      textStyle: DefaultTheme().labelSemiBold,
      fontSize: 14,
      color: DefaultTheme().gold,
      padding: 0.14,
    );
  }

  alreadyHaveAccount() {
    return RichText(
      text: TextSpan(
          text: 'Already have an account? ',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          )),
          children: <TextSpan>[
            TextSpan(
                text: ' Sign in',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.login);
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
