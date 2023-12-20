import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../utils/app_preferences.dart';

enum ThemeModeEvent { toggle }

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(Constants.themeApp);

  void toggleTheme() async {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    await AppPreferences().setThemeMode(state);
  }
}
