import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

class ChaptersModule extends Module {

  @override
  void binds(Injector i) {
  }

  @override
  void routes(r) {
    r.child(RoutesApp.root, child: (context) => Container());
  }
}