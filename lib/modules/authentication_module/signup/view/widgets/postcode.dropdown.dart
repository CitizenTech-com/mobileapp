import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/controller/registration.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCodeDropdown extends StatelessWidget {
  final RegistrationController controller;
  final List<Map<String, dynamic>> items;
  final Color dropdownColor;
  final TextStyle style;

  const PostCodeDropdown(
      {Key? key,
        required this.controller,
        required this.items,
        this.dropdownColor = Colors.white,
        required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: DefaultTheme().textFieldBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(() => DropdownButton<dynamic>(
          padding: EdgeInsets.only(left: 10),
          dropdownColor: dropdownColor,
          value: controller.postCode.value.isEmpty?null:controller.postCode.value,
          style: style,
          hint: Text("S3 7GE",
            style: GoogleFonts.poppins(
                textStyle:
                DefaultTheme().labelRegular.copyWith(fontSize: 13)),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item["code"],
              child: Text(
                item["code"] + " " + item["short_name"],
                style: GoogleFonts.poppins(
                    textStyle:
                    DefaultTheme().labelRegular.copyWith(fontSize: 13)),
              ),
            );
          }).toList(),
          onChanged: (value) {
            controller.countryCode(value);
          },
        )),
      ),
    );
  }
}
