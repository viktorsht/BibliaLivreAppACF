import 'package:flutter/material.dart';

abstract class Colors{
  Color get primaryColor;
  Color get secundaryColor;
  Color get buttonColor;
  Color get lightColorText;
  Color get darkColorText;
}

class ColorsApp implements Colors{
  @override
  Color get buttonColor => const Color(0xFFD9D9D9);

  @override
  Color get darkColorText => const Color(0xFF000000);

  @override
  Color get lightColorText => const Color(0xFFFFFFFF);

  @override
  Color get primaryColor => const Color(0xFF2B2B46);

  @override
  Color get secundaryColor => const Color(0xFFFFFFFF);

}