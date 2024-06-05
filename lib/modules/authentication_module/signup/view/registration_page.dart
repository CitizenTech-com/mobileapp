import 'dart:ffi';
import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/extensions/number.extensions.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/controller/registration.controller.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/view/widgets/address.dropdown.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/view/widgets/country.code.dropdown.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/view/widgets/postcode.dropdown.dart';
import 'package:Citizen.Tech/utils/colors.dart';
import 'package:Citizen.Tech/utils/helpers/country.codes.dart';
import 'package:Citizen.Tech/utils/images.dart';
import 'package:Citizen.Tech/utils/routes.dart';
import 'package:Citizen.Tech/widgets/CZNTech.snackbar.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/CZNTech.button.dart';
import 'package:Citizen.Tech/widgets/CZNTech.divider.dart';
import 'package:Citizen.Tech/widgets/text.fields.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
              const CZNTechDivider(),
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
        key: controller.formKey,
        child: Column(
          children: [
            InputTextField(
              key: Key("name"),
              hintText: "Full Name",
              onChanged: (value) => controller.firstName(value),
              isBorder: true,
              validate: MultiValidator([
                RequiredValidator(errorText: 'Full name is required'),
                MaxLengthValidator(30,
                    errorText: "Maximum 30 characters allowed"),
                PatternValidator(r'^[a-zA-Z0-9]+$',
                    errorText: 'Special characters not allowed')
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Email",
                onChanged: (value) => controller.email(value),
                isBorder: true,
                validate: MultiValidator([
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Please enter correct email'),
                ])),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CountryCodeDropdown(
                  controller: controller,
                  items: countryCodes,
                  dropdownColor: DefaultTheme().background,
                  style: GoogleFonts.poppins(
                      textStyle:
                          DefaultTheme().labelRegular.copyWith(fontSize: 13)),
                ),
                8.horizontalSpace(),
                Flexible(
                  flex: 2,
                  child: InputTextField(
                    hintText: "Phone",
                    onChanged: (value) => controller.phone(value),
                    isBorder: true,
                    inputType: TextInputType.number,
                    validate: MultiValidator([
                      RequiredValidator(errorText: 'Phone number is required'),
                    ]),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PostCodeDropdown(
              controller: controller,
              items: [],
              dropdownColor: DefaultTheme().background,
              style: GoogleFonts.poppins(
                  textStyle:
                      DefaultTheme().labelRegular.copyWith(fontSize: 13)),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => AddressDropdown(
                  controller: controller,
                  items: controller.postCodeJson.value.addresses,
                  dropdownColor: DefaultTheme().background,
                  style: GoogleFonts.poppins(
                      textStyle:
                          DefaultTheme().labelRegular.copyWith(fontSize: 13)),
                )),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                hintText: "Password",
                onChanged: (value) => controller.password(value),
                isBorder: true,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return "Password should be start with capital letter";
                  }
                  if (value.length < 8) {
                    return "Minimum 8 characters allowed";
                  }
                  if (value.length > 20) {
                    return "Maximum 20 characters allowed";
                  }
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return "Password required one special character";
                  }
                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
              hintText: "Confirm Password",
              onChanged: (value) => controller.confirmPassword(value),
              isBorder: true,
              validate: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                if (value!=controller.password.value) {
                  return "Confirm password not matched";
                }
                return null;
              },
            ),
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
    return CZNTechButton(
      onPressed: () {
        register();
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

  register() {
    if (controller.formKey.currentState!.validate()) {
      if (!controller.isTermsCheck.value) {
        showCZNTechSnackBar("Please accept term & condition");
      } else {
        controller.register();
      }
    }
  }

  bool validateEmail(String email) {
    if (email.contains(" ")) {
      return true;
    }
    if (!email.contains(".")) {
      return true;
    }
    if (!email.contains("@")) {
      return true;
    }
    String firstIndex = "";
    String secIndex = "";
    var firstSplitString = email.split('@');
    firstIndex = firstSplitString[0];
    secIndex = firstSplitString[1];
    if (firstIndex.isEmpty) {
      return true;
    }
    var secSplitString = secIndex.split(".");
    firstIndex = secSplitString[0];
    secIndex = secSplitString[1];
    if (firstIndex.isEmpty) {
      return true;
    } else if (secIndex.isEmpty) {
      return true;
    }
    return false;
  }
}
