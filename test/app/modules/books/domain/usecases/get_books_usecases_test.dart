import 'package:flutter_test/flutter_test.dart';
import 'package:holy_bible/app/modules/books/domain/entities/books_entities.dart';
import 'package:holy_bible/app/modules/books/domain/repositories/books_repository.dart';
import 'package:holy_bible/app/modules/books/domain/usecases/get_books_usecases.dart';
import 'package:mockito/mockito.dart';

class MockBooksRepository extends Mock implements IBooksRepository {}

void main() {
  late GetBooks getBooks;
  late IBooksRepository repository;

  setUp(() {
    repository = MockBooksRepository();
    getBooks = GetBooks(repository);
  });

  final fakeBooks = <BooksEntities>[
    BooksEntities(id: 1, name: 'Book 1', abb: 'B1', chapters: 10),
    BooksEntities(id: 2, name: 'Book 2', abb: 'B2', chapters: 5),
  ];

  test('should get a list of books from the repository', () async {
    // Arrange
    when(repository.getBooks()).thenAnswer((_) async => fakeBooks);

    // Act
    final result = await getBooks();

    // Assert
    expect(result, fakeBooks);
  });
}
