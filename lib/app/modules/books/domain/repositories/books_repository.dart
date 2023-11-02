import 'package:holy_bible/app/modules/books/domain/entities/books_entities.dart';

abstract class IBooksRepositorry{
  Future<List<BooksEntities>> getBooks();
}