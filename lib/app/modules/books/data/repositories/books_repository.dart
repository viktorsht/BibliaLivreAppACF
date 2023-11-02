import 'package:holy_bible/app/exceptions/routing_exception.dart';
import 'package:holy_bible/app/modules/books/data/datasources/books_datasouces.dart';
import 'package:holy_bible/app/modules/books/data/models/books_model.dart';
import 'package:holy_bible/app/modules/books/domain/entities/books_entities.dart';

import '../../domain/repositories/books_repository.dart';

class BooksRepository implements IBooksRepository{

  final IBookDatasource bookDatasource;
  BooksRepository(this.bookDatasource);

  @override
  Future<List<BooksEntities>> getBooks() async {
    try {
      final list = await bookDatasource.getBooks();
      return list.map((json) => BookModel.fromJson(json)).toList();
    } on IHolyBibleException catch (s,e) {
      throw ErrorListBooks(s.stackTrace, message: e.toString());
    }
  }
}