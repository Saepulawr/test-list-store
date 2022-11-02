import 'package:flutter/material.dart';
import 'package:pitjarus_test/base/themes/base_colors.dart';
import 'package:pitjarus_test/base/themes/base_fonts.dart';

class BaseThemes {
  final BuildContext context;
  BaseThemes(this.context);

  ThemeData get light => ThemeData(
        brightness: Brightness.light,
        textTheme: BaseFonts.primaryTextTheme,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: BaseColors.primaryBlue.toMaterialColor(),
        ).copyWith(
          secondary: BaseColors.secondBlue,
        ),
      );

  ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        textTheme: BaseFonts.primaryTextTheme,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: BaseColors.primaryBlue.toMaterialColor(),
        ).copyWith(
          secondary: BaseColors.secondBlue,
        ),
      );
}
