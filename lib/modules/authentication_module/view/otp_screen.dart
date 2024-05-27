import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/modules/authentication_module/controller/otp.controller.dart';
import 'package:Citizen.Tech/utils/colors.dart';
import 'package:Citizen.Tech/widgets/app.background.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/images.dart';
import '../../../widgets/custom.button.dart';
import '../../../widgets/space.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OTPController otpController;

  @override
  void initState() {
    otpController = Get.put(OTPController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      image: Images.otpBg,
      child: DefaultAppLayout(
          child: ColorfulSafeArea(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space().setVertical(0.16),
            const AppLogo(height: 86, width: 76),
            Space().setVertical(0.08),
            Label(
              text:
                  "Please enter the verification code \n             sent to your mobile.",
              style: DefaultTheme().labelRegular,
              fontSize: 12,
              color: DefaultTheme().white,
            ),
            Space().setVertical(0.06),
            Flexible(
              child: Form(
                key: otpController.formKey,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.11),
                    child: PinCodeTextField(
                      appContext: context,
                      // pastedTextStyle: const TextStyle(
                      //   color: MyColors.white,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      textStyle: TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 5,
                      obscureText: false,
                      // obscuringCharacter: '*',
                      // obscuringWidget: FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      autoFocus: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 48,
                        fieldWidth: 48,
                        activeFillColor: Color.fromARGB(40, 255, 0, 0),
                        inactiveFillColor: Color.fromARGB(40, 255, 0, 0),
                        selectedFillColor: Color.fromARGB(40, 255, 0, 0),
                        activeColor: MyColors.textFieldBorder,
                        inactiveColor: MyColors.textFieldBorder,
                        selectedColor: MyColors.gold,
                      ),
                      cursorColor: Colors.grey.shade600,
                      animationDuration: Duration(milliseconds: 300),
                      // errorAnimationController: errorController,
                      controller: otpController.controller,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
            ),
            Space().setVertical(0.06),
            confirmButton(),
          ],
        ),
      )),
    );
  }

  confirmButton() {
    return CustomButton(
      onPressed: () {},
      width: Get.width,
      text: "Confirm",
      textStyle: DefaultTheme().labelSemiBold,
      fontSize: 14,
      color: DefaultTheme().gold,
      padding: 0.10,
    );
  }
}
