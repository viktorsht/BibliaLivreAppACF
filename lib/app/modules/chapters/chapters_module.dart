import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/chapters/bloc/bloc_chapter.dart';
import 'package:holy_bible/app/modules/chapters/repositories/chapters_repository.dart';
import 'package:holy_bible/app/routes/routes_app.dart';
import 'package:http/http.dart';

import '../../external/clients/client.dart';
import '../../external/clients/http/client_http.dart';
import 'pages/chapter_page.dart';

class ChaptersModule extends Module {

  @override
  void binds(Injector i) {
    i.add(BlocChapter.new);
    i.add(ChapterRepository.new);
    i.add<IClient>(HttpService.new);
    i.addInstance(Client());
  }

  @override
  void routes(r) {
    r.child(RoutesApp.root, child: (context) => ChapterPage(
      book: r.args.data['book'], 
      chapter: r.args.data['chapter'],
    ));
  }
}