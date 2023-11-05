import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holy_bible/app/external/api/headers.dart';
import 'package:holy_bible/app/external/api/routes.dart';
import 'package:holy_bible/app/modules/books/models/books_model.dart';
import 'package:holy_bible/app/modules/books/repositories/book_repository.dart';


part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBooks extends Bloc<BlocEvent, BlocState> {
  final BookRepository bookRepository;
  
  BlocBooks(this.bookRepository) : super(SearchBooksInitial()) {
    on<SearchListBooksEvent> (_mapEventToState);
  }

  void _mapEventToState(SearchListBooksEvent event, Emitter<BlocState> emit) async {
    emit(SearchBooksLoadingState());
    try{
      final response = await bookRepository.fetchData(RoutesApi.books, HeadersApi.getHeaders());
      emit(SearchBooksSucessState(data: response));
    }
    catch(e){
      emit(SearchBooksErrorState(message: e.toString()));
    }
  }
}