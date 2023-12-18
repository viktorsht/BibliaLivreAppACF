import 'package:flutter/material.dart';
import 'package:holy_bible/app/components/widgets/app_bar_component.dart';
import 'package:holy_bible/app/modules/settings/pages/components/increase_font_size.dart';
import 'package:holy_bible/app/modules/settings/pages/components/theme_mode_change.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Configurações'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Altere tamanho da fonte',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            const SizedBox(
              height: 80,
              width: 300,
              child: IncreaseFontSizeComponent()
            ),
            const Text(
              'Altere o tema',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            const ThemeModeChange(),
          ],
        ),
      ),
    );
  }
}
