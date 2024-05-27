import 'package:Citizen.Tech/modules/authentication_module/controller/registration.controller.dart';
import 'package:Citizen.Tech/modules/authentication_module/view/login_screen.dart';
import 'package:Citizen.Tech/widgets/app.background.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/custom.divider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/themes.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../widgets/custom.button.dart';
import '../../../widgets/space.dart';
import '../../../widgets/text.fields.dart';
import '../../../widgets/texts.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isChecked = false;
  late RegistrationController registrationController;

  @override
  void initState() {
    registrationController = Get.put(RegistrationController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      image: Images.splashBg,
      child: DefaultAppLayout(
        child: ColorfulSafeArea(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Space().setVertical(0.02),
                header(),
                Space().setVertical(0.04),
                userInputFields(),
                const SizedBox(
                  height: 28,
                ),
                termsCondition(),
                const SizedBox(
                  height: 15,
                ),
                signUpButton(),
                const SizedBox(
                  height: 20,
                ),
                alreadyHaveAccount(),
                const SizedBox(
                  height: 15,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 15,
                ),
                connectWithText(),
                Space().setVertical(0.06),
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
            fontSize: 36,
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
                controller: registrationController.userName,
                hintText: "User Name",
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                controller: registrationController.email,
                hintText: "Email",
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                controller: registrationController.phone,
                hintText: "Phone",
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                controller: registrationController.postCode,
                hintText: "Post Code",
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                controller: registrationController.address,
                hintText: "Address",
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                controller: registrationController.password,
                hintText: "Password",
                isBorder: true),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                controller: registrationController.confirmPassword,
                hintText: "Confirm Password",
                isBorder: true),
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
        Get.to(const RegistrationScreen());
      },
      width: Get.width,
      text: "Sign Up",
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
                text: ' Log in',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(LoginScreen());
                    // navigate to desired screen
                  })
          ]),
    );
  }

  connectWithText() {
    return Label(
      text: "Connect with",
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
