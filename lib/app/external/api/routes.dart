import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String urlApi = dotenv.env['BASE_URL'] ?? '';
}
class RoutesApi{
  
  static String books = '${Api.urlApi}books';
  static String showChapter = '${Api.urlApi}verses/';
  static String about = '${Api.urlApi}about';

}