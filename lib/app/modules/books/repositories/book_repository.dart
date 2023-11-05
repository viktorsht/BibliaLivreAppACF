import 'dart:convert';
import 'package:holy_bible/app/external/clients/http/client_http.dart';
import 'package:holy_bible/app/modules/books/models/books_model.dart';

class BookRepository{
  final HttpService httpService;

  BookRepository(this.httpService);

  Future<List<BookModel>> fetchData(String url, Map<String, String> headers) async{
    final response = await httpService.get(url, headers);
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => BookModel.fromJson(json)).toList();
  }
}