import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ThemeModeEvent { toggle }

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}