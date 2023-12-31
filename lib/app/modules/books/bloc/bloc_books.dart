import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holy_bible/app/exceptions/routing_exception.dart';
import 'package:holy_bible/app/external/api/headers.dart';
import 'package:holy_bible/app/external/api/routes.dart';
import 'package:holy_bible/app/modules/books/repositories/book_repository.dart';
import '../../../models/books_model.dart';


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
      final response = await bookRepository.fetchData(RoutesApi.books,HeadersApi.getHeaders());
      emit(SearchBooksSucessState(data: response));
    }
    on ClientExceptionHolyBible{
      emit(SearchBooksErrorState(message: 'Verifique sua conexão e tente novamente.'));
    }
    on SocketExceptionHolyBible{
      emit(SearchBooksErrorState(message: 'Verifique sua conexão e tente novamente.'));
    }
    on PutAppException{
      emit(SearchBooksErrorState(message: 'Atualize o aplicativo para a nova versão'));
    }
    catch(e){
      emit(SearchBooksErrorState(message: e.toString()));
    }
  }
}