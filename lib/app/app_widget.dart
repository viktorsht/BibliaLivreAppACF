import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/constants/constants.dart';

import 'modules/settings/cubit/theme_mode_cubit.dart';
import 'themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  static void setAppPreferences(double newFontSize, ThemeMode newThemeData) {
    Constants.fontSizeMin = newFontSize;
    Constants.themeApp = newThemeData;
  }

  @override
  Widget build(BuildContext context){
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (BuildContext context, ThemeMode themeMode) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Biblia Livre',
        routerConfig: Modular.routerConfig,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeMode,
      ),
    ); //added by extension 
  }
}