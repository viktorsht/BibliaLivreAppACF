import 'package:holy_bible/app/exceptions/routing_exception.dart';
import 'package:holy_bible/app/external/api/headers.dart';
import 'package:holy_bible/app/modules/books/data/datasources/books_datasouces.dart';

import '../../../external/api/routes.dart';
import '../../../external/clients/http/client_http.dart';

class BookDatasource implements IBookDatasource{
  final HttpService client;

  BookDatasource(this.client);

  @override
  Future<List> getBooks() async {
    try {
      final response = await client.get(RoutersApi.books, HeadersApi.getHeaders());
      return response;
    } catch (e) {
      throw ErrorListBooks(null, message: e.toString());
    }
  }

}