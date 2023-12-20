import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

enum ThemeModeEvent { toggle }

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(Constants.themeApp);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
