import 'package:holy_bible/app/modules/books/domain/entities/books_entities.dart';

class BookModel {
  static BooksEntities fromJson(dynamic json) {
    return BooksEntities(
      id: json['id'],
      name: json['name'],
      abb: json['abbrev'],
      chapters: json['chapters'],
    );
  }
}
