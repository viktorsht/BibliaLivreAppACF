import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/constants/colors_app.dart';
import 'package:holy_bible/app/modules/books/bloc/bloc_books.dart';

import '../../../components/widgets/erro_component.dart';
import '../../../components/widgets/loading_component.dart';
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
      appBar: AppBar(
        title: const Text('Biblia Sagrada ACF Livre'),
        centerTitle: true,
        backgroundColor: ColorsApp.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BlocBooks, BlocState>(
            bloc: blocBooks,
            builder: (context, state) {
              if(state is SearchBooksErrorState){
                return ErroComponent(errorMessage: state.message);
              }
              else if(state is SearchBooksSucessState){
                return Expanded(
                  child: ListBooks(
                    list: state.data,
                  )
                );
              }
              //print(state);
              return const LoadinComponent();
              //return Container();
            },
          ),
        ],
      ),
    );
  }
}