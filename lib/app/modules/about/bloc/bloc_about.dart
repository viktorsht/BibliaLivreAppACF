import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holy_bible/app/modules/about/models/about_model.dart';
import 'package:holy_bible/app/modules/about/repositories/about_repository.dart';

import '../../../external/api/headers.dart';
import '../../../external/api/routes.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocAbout extends Bloc<BlocEvent, BlocState> {

  final AboutRepository aboutRepository;
  
  BlocAbout(this.aboutRepository) : super(AboutInitial()) {
    on<AboutEvent> (_mapEventToState);
  }

  void _mapEventToState(AboutEvent event, Emitter<BlocState> emit) async {
    emit(AboutLoadingState());
    try{
      final data = await aboutRepository.fetchData(RoutesApi.about, HeadersApi.getHeaders());
      emit(AboutSucessState(data: data));
    }
    catch(e){
      emit(AboutErrorState(message: e.toString()));
    }
  } 
} 