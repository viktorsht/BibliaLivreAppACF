import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/constants/colors_app.dart';
import 'package:holy_bible/app/constants/images.dart';
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
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorsApp.buttonColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(Images.logoWhite)),
                Text(
                  'Biblia Sagrada ACF Livre',
                  style: TextStyle(
                    color: ColorsApp.darkColorText,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Bem vindo(a)',
                  style: TextStyle(
                    color: ColorsApp.darkColorText,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () => Modular.to.pushNamed(RoutesApp.settings),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre'),
            onTap: () => Modular.to.pushNamed(RoutesApp.about),
          ),
        ],
      ),
    );
  }
}