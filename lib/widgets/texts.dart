import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle style;
  final Color color;
  final TextAlign textAlign;

  const Label(
      {super.key,
      required this.text,
      this.fontSize = 14,
      required this.style,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: GoogleFonts.poppins(
            textStyle: style.copyWith(color: color), fontSize: fontSize));
  }
}
