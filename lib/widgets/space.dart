import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Space {
  Widget setHorizontal(double percent) {
    return SizedBox(width: Get.width * percent);
  }

  Widget setVertical(double percent) {
    return SizedBox(height: Get.height * percent);
  }
}
