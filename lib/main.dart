import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/books/bloc/bloc_books.dart';
import 'package:holy_bible/app/modules/books/repositories/book_repository.dart';
import 'package:holy_bible/app/modules/chapters/bloc/bloc_chapter.dart';
import 'package:holy_bible/app/modules/chapters/repositories/chapters_repository.dart';
import 'package:holy_bible/app/modules/search_books/bloc/bloc_search_book.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  initializeDateFormatting().then(
    (_) => runApp(
      MultiProvider(
        providers: [
          BlocProvider<BlocBooks>(create: (context) => BlocBooks(Modular.get<BookRepository>())),
          BlocProvider<BlocChapter>(create: (context) => BlocChapter(Modular.get<ChapterRepository>())),
          BlocProvider<BlocSearchBook>(create: (context) => BlocSearchBook()),
        ],
        child: ModularApp(
          module: AppModule(), 
          child: const AppWidget(),
        ),
      ),
    )
  );
}