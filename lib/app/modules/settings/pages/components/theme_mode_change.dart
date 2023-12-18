import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/theme_mode_cubit.dart';

class ThemeModeChange extends StatelessWidget {
  const ThemeModeChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[ 
        const Icon(Icons.light_mode),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            alignment: Theme.of(context).brightness == Brightness.dark 
              ? Alignment.centerRight 
              : Alignment.centerLeft,
            child: Switch(
              activeColor: Theme.of(context).colorScheme.background,
              value: BlocProvider.of<ThemeModeCubit>(context).state == ThemeMode.dark,
              onChanged: (value) {
                BlocProvider.of<ThemeModeCubit>(context).toggleTheme();
              },
            ),
          ),
        ),
        const Icon(Icons.dark_mode)
      ]
    );
  }
}
