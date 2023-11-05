part of 'bloc_books.dart';

@immutable
sealed class BlocState {}

final class SearchBooksInitial extends BlocState {}

class SearchBooksErrorState extends BlocState {
  final String message;

  SearchBooksErrorState({required this.message});
}

class SearchBooksSucessState extends BlocState {
  final List<BookModel> data;

  SearchBooksSucessState({required this.data});
}

class SearchBooksLoadingState extends BlocState {
  SearchBooksLoadingState();
}

