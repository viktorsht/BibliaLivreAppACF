part of 'bloc_search_book.dart';

@immutable
sealed class BlocEvent {}

class SearchBookEvent extends BlocEvent{
  final String nameBook;
  final List<BookModel> list;

  SearchBookEvent({required this.nameBook, required this.list});

}

class SearchBookInitialEvent extends BlocEvent{}