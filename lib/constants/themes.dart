import 'package:flutter/material.dart';

class DefaultTheme {
  // default base theme.
  ThemeData base = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    // unselectedWidgetColor: MyColors.button,
    useMaterial3: true,
  );

  // colors define here.
  Color black = const Color(0xFF000000);
  Color white = const Color(0xFFffffff);
  Color red = const Color(0xFFFF0000);
  Color background = const Color(0xff7D000C);
  Color gold = const Color(0xffBF9D56);
  Color facebook = const Color(0xff1877F2);
  Color textFieldBorder = const Color(0xffA3A3A3);
  Color divider = const Color(0xffA3A3A3);

  // Label text style define here.
  TextStyle labelRegular = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w400);

  TextStyle labelMedium = const TextStyle(
      color: Colors.white,fontWeight: FontWeight.w500);

  TextStyle labelSemiBold = const TextStyle(
      color: Colors.white,fontWeight: FontWeight.w600);

  TextStyle labelBold = const TextStyle(
      color: Colors.white,fontWeight: FontWeight.bold);

  // Textfields style define here
  TextStyle txtFieldRegular = const TextStyle(
      color: Colors.white,fontWeight: FontWeight.w400);

  // Button text style define here.

  TextStyle btnSemiBold = const TextStyle(
      color: Colors.white,fontWeight: FontWeight.w600);
}
