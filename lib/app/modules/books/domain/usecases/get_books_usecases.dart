import 'package:holy_bible/app/modules/books/domain/repositories/books_repository.dart';

import '../entities/books_entities.dart';

abstract class IGetBooks{
  Future<List<BooksEntities>> call();
}

class GetBooks implements IGetBooks{
  final IBooksRepository repository;
  GetBooks(this.repository);

  @override
  Future<List<BooksEntities>> call() async {
    return repository.getBooks();
  }

}