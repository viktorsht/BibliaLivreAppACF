import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/app/modules/contribute/cubit/contribute_state.dart';

class ClipboardCubit extends Cubit<ClipboardState> {
  ClipboardCubit() : super(ClipboardState(false));

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    emit(ClipboardState(true));

  } 
}