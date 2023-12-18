import 'package:flutter/material.dart';

class ColorsApp {
  // light mode
  static Color get primaryColor => const Color(0xff2b2b46);
  static Color get secundaryColor => const Color(0xFFFFFFFF);
  static Color get background => const Color(0xFFd8d8de);
  static Color get primaryColorText => const Color(0xFFFFFFFF);
  static Color get secundaryColorText => const Color(0xFF000000);

  // dark mode
  //static Color get primaryColorDark => const Color(0xff2b2b46);
  static Color get primaryColorDark => const Color(0xFF000000);
  static Color get secundaryColorDark => const Color(0xFFFFFFFF);
  static Color get backgroundDark => const Color.fromARGB(255, 110, 110, 118);
  static Color get primaryColorTextDark => const Color(0xFF000000);
  static Color get secundaryColorTextDark => const Color(0xFFFFFFFF);
}
