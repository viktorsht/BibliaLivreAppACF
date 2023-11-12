import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/constants/colors_app.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsApp.secundaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre'),
            onTap: () => Modular.to.pushNamed(RoutesApp.about),
          )
        ],
      ),
    );
  }
}