import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/about/repositories/about_repository.dart';
import 'package:holy_bible/app/modules/books/bloc/bloc_books.dart';
import 'package:holy_bible/app/modules/books/repositories/book_repository.dart';
import 'package:holy_bible/app/modules/chapters/bloc/bloc_chapter.dart';
import 'package:holy_bible/app/modules/chapters/repositories/chapters_repository.dart';
import 'package:holy_bible/app/modules/search_books/bloc/bloc_search_book.dart';
import 'package:holy_bible/app/modules/settings/cubit/increase_font_size_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/modules/about/bloc/bloc_about.dart';
import 'app/modules/settings/cubit/theme_mode_cubit.dart';
import 'app/utils/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  await loadPreferences();

  initializeDateFormatting().then(
    (_) => runApp(
      MultiProvider(
        providers: [
          BlocProvider<BlocBooks>(create: (context) => BlocBooks(Modular.get<BookRepository>())),
          BlocProvider<BlocChapter>(create: (context) => BlocChapter(Modular.get<ChapterRepository>())),
          BlocProvider<BlocAbout>(create: (context) => BlocAbout(Modular.get<AboutRepository>())),
          BlocProvider<BlocSearchBook>(create: (context) => BlocSearchBook()),
          BlocProvider<IncreaseFontSizeCubit>(create: (context) => IncreaseFontSizeCubit()),
          BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),
        ],
        child: ModularApp(
          module: AppModule(), 
          child: const AppWidget(),
        ),
      ),
    )
  );
}

Future<void> loadPreferences() async {
  final appPreferences = AppPreferences();
  double fontSize = await appPreferences.getFontSize();
  ThemeMode themeMode = await appPreferences.getThemeMode();
  AppWidget.setAppPreferences(fontSize, themeMode);
}