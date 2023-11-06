import 'dart:convert';
import 'package:holy_bible/app/external/clients/client.dart';
import 'package:holy_bible/app/models/books_model.dart';

class BookRepository{
  final IClient service;

  BookRepository(this.service);

  Future<List<BookModel>> fetchData(String url, Map<String, String> headers) async{
    final response = await service.get(url, headers);
    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((json) => BookModel.fromJson(json)).toList();
  }
}