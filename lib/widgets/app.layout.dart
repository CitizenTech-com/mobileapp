import 'package:Citizen.Tech/constants/themes.dart';
import 'package:Citizen.Tech/widgets/app.appbar.dart';
import 'package:flutter/material.dart';

class DefaultAppLayout extends StatelessWidget {
  final Widget child;
  const DefaultAppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DefaultAppBar(),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: child,
    );
  }
}
