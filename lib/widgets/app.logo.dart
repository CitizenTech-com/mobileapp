import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/images.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double width;
  const AppLogo({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Images.logo,
      height: height,
      width: width,
    );
  }
}
