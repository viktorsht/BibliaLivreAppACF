import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/app/constants/constants.dart';

class IncreaseFontSizeCubit extends Cubit<double> {
  IncreaseFontSizeCubit() : super(Constants.fontSizeMin);

  void increment() {
    if(state < Constants.fontSizeMax ) {
      emit(state + 1);
    }
  } 
    
  void decrement(){
    if(state > Constants.fontSizeMin){
      emit(state - 1);
    }
  } 
  void updateSliderValue(double value) => emit(value);
}