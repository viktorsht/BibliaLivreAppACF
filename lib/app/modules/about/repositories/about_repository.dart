import 'dart:convert';

import 'package:holy_bible/app/external/clients/client.dart';
import 'package:holy_bible/app/modules/about/models/about_model.dart';

class AboutRepository{
  final IClient service;

  AboutRepository(this.service);

  Future<AboutModel> fetchData(String url, Map<String, String> headers) async{
    final response = await service.get(url, headers);
    return AboutModel.fromJson(jsonDecode(response.body));
  }
}