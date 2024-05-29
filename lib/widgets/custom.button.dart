import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isTransparent;
  final bool isBorder;
  final double height;
  final double width;
  final double radius;
  final Color color;
  final Color textColor;
  final String text;
  final double fontSize;
  final double padding;
  final TextStyle textStyle;

  const CustomButton(
      {super.key,
      required this.onPressed,
      this.isTransparent = false,
      this.isBorder = false,
      this.height = 40,
      this.width = 250,
      this.radius = 5,
      this.color = Colors.blue,
      this.fontSize = 14,
      this.padding = 0.12,
      required this.text,
      required this.textStyle,this.textColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          isTransparent ? const Color.fromARGB(40, 255, 0, 0) : color,
      side: isBorder ? BorderSide(color: DefaultTheme().gold) : null,
    );
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: Get.width * padding),
      width: width,
      height: height,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Label(
          text: text,
          fontSize: fontSize,
          style: textStyle,
          color: textColor,
        ),
      ),
    );
  }
}
