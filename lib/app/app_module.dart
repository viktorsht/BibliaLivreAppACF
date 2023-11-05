import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/books/pages/list_books_page.dart';

import 'modules/books/bloc/bloc_books.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(BlocBooks.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ListBooksPage());
  }
}