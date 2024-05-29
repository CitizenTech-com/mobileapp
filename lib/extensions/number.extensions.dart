import 'package:Citizen.Tech/widgets/empty.widget.dart';
import 'package:flutter/widgets.dart';

extension IntegerExtensions on int {
  Widget verticalSpace() => EmptyWidget(height: this.toDouble());
  Widget horizontalSpace() => EmptyWidget(width: this.toDouble());
}

extension DoubleExtensions on double {
  Widget verticalSpace() => EmptyWidget(height: this);
  Widget horizontalSpace() => EmptyWidget(width: this);
}
