part of 'bloc_search_book.dart';

@immutable
sealed class BlocState {}

final class SearchBookInitial extends BlocState {}

class SearchBookErrorState extends BlocState {
  final String message;

  SearchBookErrorState({required this.message});
}

class SearchBookSucessState extends BlocState {
  final BookModel data;

  SearchBookSucessState({required this.data});
}

class SearchBookLoadingState extends BlocState {
  SearchBookLoadingState();
}

