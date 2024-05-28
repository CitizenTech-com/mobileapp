import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppLayout extends StatelessWidget {
  final Widget child;
  final String? bgImage;

  const DefaultAppLayout({super.key, required this.child, this.bgImage});

  @override
  Widget build(BuildContext context) {
    return bgImage != null
        ? Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              bgImage!,
            ),
            fit: BoxFit.fill),
      ),
      child: childWidget(),
    ) : childWidget();
  }

  Widget childWidget(){
    return Scaffold(
      // appBar: DefaultAppBar(),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: child,
    );
  }
}
