import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holy_bible/app/external/api/headers.dart';
import 'package:holy_bible/app/external/api/routes.dart';
import 'package:holy_bible/app/modules/chapters/models/chapters_model.dart';
import 'package:holy_bible/app/modules/chapters/repositories/chapters_repository.dart';


part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocChapter extends Bloc<BlocEvent, BlocState> {
  final ChapterRepository chapterRepository;
  
  BlocChapter(this.chapterRepository) : super(ShowChapterInitial()) {
    on<ShowChapterEvent> (_mapEventToState);
  }

  void _mapEventToState(ShowChapterEvent event, Emitter<BlocState> emit) async {
    emit(ShowChapterLoadingState());
    try{
      final url = '${RoutesApi.showChapter}${event.book}/${event.chapter}';
      final response = await chapterRepository.fetchData(url, HeadersApi.getHeaders());
      emit(ShowChapterSucessState(data: response));
    }
    catch(e){
      emit(ShowChapterErrorState(message: e.toString()));
    }
  }
}