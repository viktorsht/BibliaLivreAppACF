import 'dart:convert';
import 'package:holy_bible/app/external/clients/client.dart';
import 'package:holy_bible/app/modules/chapters/models/chapters_model.dart';

class ChapterRepository{
  final IClient service;

  ChapterRepository(this.service);

  Future<ChapterModel> fetchData(String url, Map<String, String> headers) async{
    final response = await service.get(url, headers);
    final json = jsonDecode(response.body);
    return ChapterModel.fromJson(json);
  }
}