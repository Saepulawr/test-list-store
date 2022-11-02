import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pitjarus_test/base/themes/base_colors.dart';

class BaseFonts {
  static TextTheme primaryTextTheme = GoogleFonts.poppinsTextTheme();
  static TextStyle primaryFont =
      GoogleFonts.poppins(color: BaseColors.primaryBlack);

  static TextStyle h1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    // height: 42,
  );
  static TextStyle h2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    // height: 32,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 16,
    // height: 24,
  );
  static TextStyle h3Bold = h3.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle h3SemiBold = h3.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle h3Medium = h3.copyWith(
    fontWeight: FontWeight.w500,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    // height: 21,
  );
  static TextStyle h4Bold = h4.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle h4SemiBold = h4.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle h4Medium = h4.copyWith(
    fontWeight: FontWeight.w500,
  );

  static TextStyle semiBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
