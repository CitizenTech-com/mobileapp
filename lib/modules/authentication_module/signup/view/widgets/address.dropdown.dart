import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/models/post.code.json.dart';
import 'package:Citizen.Tech/modules/authentication_module/signup/controller/registration.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressDropdown extends StatelessWidget {
  final RegistrationController controller;
  final List<Address> items;
  final Color dropdownColor;
  final TextStyle style;

  const AddressDropdown(
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
        child: DropdownButton<dynamic>(
          padding: EdgeInsets.only(left: 10),
          dropdownColor: dropdownColor,
          value: controller.address.isEmpty ? null : controller.address.value,
          style: style,
          hint: Text("Address",
            style: GoogleFonts.poppins(
                textStyle:
                DefaultTheme().labelRegular.copyWith(fontSize: 13)),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item.st,
              child: Text(
                item.bn+" "+item.fn+" "+item.hn+" "+item.st,
                style: GoogleFonts.poppins(
                    textStyle:
                    DefaultTheme().labelRegular.copyWith(fontSize: 13)),
              ),
            );
          }).toList(),
          onChanged: (value) {
            controller.address(value);
          },
        ),
      ),
    );
  }
}
