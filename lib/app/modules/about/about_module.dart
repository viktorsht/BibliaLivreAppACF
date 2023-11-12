import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/routes/routes_app.dart';
import 'package:http/http.dart';

import '../../external/clients/client.dart';
import '../../external/clients/http/client_http.dart';
import 'bloc/bloc_about.dart';
import 'pages/about_page.dart';
import 'repositories/about_repository.dart';

class AboutModule extends Module{
  @override
  void binds(i){
    i.add(BlocAbout.new);
    i.add(AboutRepository.new);
    i.add<IClient>(HttpService.new);
    i.addInstance(Client());
  }

  @override
  void routes(r){
    r.child(RoutesApp.root, child: (context) => const AboutPage());
  }
}