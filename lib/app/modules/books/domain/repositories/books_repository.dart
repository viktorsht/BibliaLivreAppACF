import 'package:holy_bible/app/modules/books/domain/entities/books_entities.dart';

abstract class IBooksRepository{
  Future<List<BooksEntities>> getBooks();
}