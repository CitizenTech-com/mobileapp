import 'package:Citizen.Tech/widgets/empty.widget.dart';
import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  Widget hideIf(isCondition) => isCondition ? this : EmptyWidget();
}
