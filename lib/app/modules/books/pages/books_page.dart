import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/books/bloc/bloc_books.dart';

import '../../../components/widgets/erro_component.dart';
import '../../../components/widgets/loading_component.dart';
import '../../search_books/widgets/search_books_widgets.dart';
import 'components/list_books.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {

  final BlocBooks blocBooks = Modular.get<BlocBooks>();

  @override
  void initState() {
    super.initState();
    blocBooks.add(SearchListBooksEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocBooks, BlocState>(
        bloc: blocBooks,
        builder: (context, state) {
          if(state is SearchBooksErrorState){
            return ErroComponent(errorMessage: state.message);
          }
          else if(state is SearchBooksSucessState){
            return Column(
              children: [
                SearchBooksWidget(list: state.data),
                Expanded(
                  child: ListBooks(list: state.data),
                ),
              ],
            );
          }
          return const LoadinComponent();
        },
      ),
    );
  }
}