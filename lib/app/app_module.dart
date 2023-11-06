import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/external/clients/http/client_http.dart';
import 'package:holy_bible/app/modules/books/pages/books_page.dart';
import 'package:holy_bible/app/modules/books/pages/components/list_chapters.dart';
import 'package:holy_bible/app/modules/books/repositories/book_repository.dart';
import 'package:holy_bible/app/routes/routes_app.dart';
import 'package:http/http.dart';

import 'external/clients/client.dart';
import 'modules/books/bloc/bloc_books.dart';
import 'modules/chapters/chapters_module.dart';

class AppModule extends Module {

  @override
  void binds(Injector i) {
    i.add(BlocBooks.new);
    i.add(BookRepository.new);
    i.add<IClient>(HttpService.new);
    i.addInstance(Client());
  }

  @override
  void routes(r) {
    r.child(RoutesApp.root, child: (context) => const BooksPage());
    r.child(RoutesApp.listChapters, child: (context) => ListChapters(book: r.args.data));
    r.module(RoutesApp.showChapters, module: ChaptersModule());
  }
}