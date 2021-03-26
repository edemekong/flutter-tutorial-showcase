import 'package:flutter/widgets.dart';

extension Xpadding on Widget {
  Padding paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Padding paddingVertical(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );
}
