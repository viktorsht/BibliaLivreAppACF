import 'package:flutter/material.dart';

import 'colors_app.dart';

class CustomElevatedButtonStyle {
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    //maximumSize: const Size(0.7 * double.infinity, 0),
    //foregroundColor: ColorsApp.darkColorText, // Cor de fundo quando pressionado
    backgroundColor: ColorsApp.secundaryColor, // Cor do texto
    padding: const EdgeInsets.all(16), // Preenchimento interno
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Borda arredondada
    ),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: ColorsApp.darkColorText, // Cor de fundo quando pressionado
    backgroundColor: ColorsApp.buttonColor, // Cor do texto 
    padding: const EdgeInsets.all(16), // Preenchimento interno
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Borda arredondada
    ),
  );
}
