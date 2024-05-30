import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/widgets/texts.dart';
import 'package:flutter/material.dart';

class CZNTechDivider extends StatelessWidget {
  const CZNTechDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 0.5,
              color: DefaultTheme().divider,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Label(
              text: 'or',
              style: DefaultTheme().labelRegular,
              color: DefaultTheme().white,
              fontSize: 15,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 0.5,
              color: DefaultTheme().divider,
            ),
          )
        ],
      ),
    );
  }
}
