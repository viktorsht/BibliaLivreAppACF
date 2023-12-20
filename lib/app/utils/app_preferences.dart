import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class AppPreferences {
  static const _keyFontSize = 'font_size';
  static const _keyTheme = 'app_theme';

  // Método para obter o tamanho da fonte salvo nas preferências
  Future<double> getFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyFontSize) ?? Constants.fontSizeMin; // Valor padrão: 16.0
  }

  // Método para salvar o tamanho da fonte nas preferências
  Future<void> setFontSize(double fontSize) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyFontSize, fontSize);
  }

  // Método para obter o tema do aplicativo salvo nas preferências
  Future<ThemeData> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeString = prefs.getString(_keyTheme) ?? Constants.light; // Valor padrão: 'light'
    
    // Converte a string do tema em um objeto ThemeData
    return themeString == Constants.light ? ThemeData.light() : ThemeData.dark();
  }

  // Método para salvar o tema do aplicativo nas preferências
  Future<void> setTheme(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTheme, isDarkTheme ? Constants.dark : Constants.light);
  }
}
