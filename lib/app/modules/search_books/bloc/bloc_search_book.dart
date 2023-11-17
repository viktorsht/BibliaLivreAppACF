import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../models/books_model.dart';
import '../../../utils/remove_accents.dart';


part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocSearchBook extends Bloc<BlocEvent, BlocState> {
  
  BlocSearchBook() : super(SearchBookInitial()) {
    on<SearchBookEvent> (_mapEventToState);
    on<SearchBookInitialEvent> (_initialState);
  }

  void _mapEventToState(SearchBookEvent event, Emitter<BlocState> emit) async {
    emit(SearchBookLoadingState());
    try{
      BookModel? book = searchInList(event.nameBook, event.list);
      if(book != null){
        emit(SearchBookSucessState(data: book));
      }
      else{
        emit(SearchBookErrorState(message: 'Livro não encontrado'));
      }
    }
    catch(e){
      emit(SearchBookErrorState(message: e.toString()));
    }
  }

  void _initialState(SearchBookInitialEvent event, Emitter<BlocState> emit){
    emit(SearchBookInitial());
  }

  BookModel? searchInList(String searchTerm, List<BookModel> list) {
    String searchTermWithoutAccents = removeAccents(searchTerm.toLowerCase());
    for (BookModel book in list) {
      String wordWithoutAccents = removeAccents(book.name!.toLowerCase());
      if (wordWithoutAccents.contains(searchTermWithoutAccents)) {
        return book;
      }
    }
    return null;
  }
  
}