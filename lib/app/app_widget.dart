import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Biblia Livre',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(useMaterial3: true),
    ); //added by extension 
  }
}