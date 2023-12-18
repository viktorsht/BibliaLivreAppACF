import 'package:flutter/material.dart';
import 'package:holy_bible/app/constants/colors_app.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true).copyWith(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(

        primary: ColorsApp.primaryColor,
        secondary: ColorsApp.secundaryColor,
        background: ColorsApp.background,

        onPrimary: ColorsApp.primaryColorText,
        onSecondary: ColorsApp.secundaryColorText,
      )
  );
  static ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true).copyWith(
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: ColorsApp.primaryColorDark,
        secondary: ColorsApp.secundaryColorDark,
        background: ColorsApp.backgroundDark,

        onPrimary: ColorsApp.primaryColorTextDark,
        onSecondary: ColorsApp.secundaryColorTextDark,
      )
  );
}
