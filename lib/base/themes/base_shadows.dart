import 'package:flutter/cupertino.dart';

class BaseShadows {
  BaseShadows._();

  static BoxShadow defaultShadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
  }) =>
      BoxShadow(
          color: color ?? Color(0xff363636).withOpacity(0.5),
          offset: offset ?? Offset(0, 4),
          blurRadius: blurRadius ?? 4);
}
