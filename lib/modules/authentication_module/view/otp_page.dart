import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/extensions/number.extensions.dart';
import 'package:Citizen.Tech/utils/colors.dart';
import 'package:Citizen.Tech/widgets/app.layout.dart';
import 'package:Citizen.Tech/widgets/app.logo.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/images.dart';
import '../../../widgets/custom.button.dart';

class OTPPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAppLayout(
        bgImage: Images.otpBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            138.verticalSpace(),
            const AppLogo(height: 86, width: 76),
            58.verticalSpace(),
            Label(
              text:
                  "Please enter the verification code \n             sent to your mobile.",
              style: DefaultTheme().labelRegular,
              fontSize: 12,
              color: DefaultTheme().white,
            ),
            35.verticalSpace(),
            Flexible(
              child: Form(
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
                      controller: controller,
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
            35.verticalSpace(),
            confirmButton(),
          ],
        ));
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
