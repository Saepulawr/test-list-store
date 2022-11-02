import 'dart:math';

import 'package:flutter/material.dart';

class BaseColors {
  BaseColors._();
  static const Color primaryBlue = Color(0xff0066bf);
  static const Color secondBlue = Color(0xff1363DF);
  static const Color thirdBlue = Color(0xff0077B6);
  static const Color fourthBlue = Color(0xff90E0EF);
  static const Color primaryBlack = Color(0xff363636);
  static const Color secondBlack = Color(0xff143048);
  static Color thirdBlack = const Color(0xff363636).withOpacity(0.5);
  static Color fourthBlack = const Color(0xff363636).withOpacity(0.3);
  static const Color primaryGrey = Color(0xff6C757D);
  static const Color secondGrey = Color(0xffDEE2E6);
  static Color primaryStroke = const Color(0xffCFD2CF).withOpacity(0.9);
  static const Color primaryWhite = Color(0xffFFFFFF);
  static Color secondWhite = const Color(0xffFFFFFF).withOpacity(0.5);
  static const Color primaryGreen = Color(0xff80B918);
  static const Color primaryMaroon = Color(0xffBA135D);
  static const Color primaryRed = Color(0xffDC2F02);
  static const Color secondRed = Color(0xffEB1D36);
}

extension ColorExtension on Color {
  MaterialColor toMaterialColor() {
    return MaterialColor(value, {
      50: tintColor(this, 0.9),
      100: tintColor(this, 0.8),
      200: tintColor(this, 0.6),
      300: tintColor(this, 0.4),
      400: tintColor(this, 0.2),
      500: this,
      600: shadeColor(this, 0.1),
      700: shadeColor(this, 0.2),
      800: shadeColor(this, 0.3),
      900: shadeColor(this, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));
  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
