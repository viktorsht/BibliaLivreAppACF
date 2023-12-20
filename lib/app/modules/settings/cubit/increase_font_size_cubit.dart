import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/app/constants/constants.dart';

import '../../../utils/app_preferences.dart';

class IncreaseFontSizeCubit extends Cubit<double> {
  IncreaseFontSizeCubit() : super(Constants.fontSizeMin);

  void increment() async {
    if(state < Constants.fontSizeMax ) {
      emit(state + 1);
      await AppPreferences().setFontSize(state + 1);
    }
  } 
    
  void decrement() async {
    if(state > Constants.fontSizeMin){
      emit(state - 1);
      await AppPreferences().setFontSize(state - 1);
    }
  } 

  void updateSliderValue(double value) async {
    emit(value);
    await AppPreferences().setFontSize(value);
  } 
}