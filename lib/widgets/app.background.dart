import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackground extends StatelessWidget {
  final String image;
  final Widget child;

  const AppBackground({super.key, required this.image, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
