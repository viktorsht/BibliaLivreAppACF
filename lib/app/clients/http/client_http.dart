import 'package:http/http.dart' as http;

import '../client.dart';

class HttpService implements Client{

  final http.Client client;

  HttpService(this.client);

  @override
  Future<dynamic> get(String url, Map<String, String> headers) async {
    final response = await client.get(Uri.parse(url), headers: headers);
    return response;
  }
}