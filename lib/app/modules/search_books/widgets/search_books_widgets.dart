import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/components/show_book.dart';
import 'package:holy_bible/app/components/widgets/loading_component.dart';
import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/modules/search_books/model/search_book_model.dart';
import 'package:provider/provider.dart';

import '../../../components/widgets/text_form_field_widget.dart';
import '../../../routes/routes_app.dart';
import '../bloc/bloc_search_book.dart';

class SearchBooksWidget extends StatelessWidget {
  final List<BookModel> list;
  const SearchBooksWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    BlocSearchBook blocSearchBook = Provider.of<BlocSearchBook>(context);
    SearchBookModel bookModel = SearchBookModel.empty();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: WidgetFormField(
                  hint: 'Procure um livro aqui', 
                  value: bookModel.book,
                  onChanged: bookModel.setBook,
                  suffix: IconButton(
                    onPressed: () {
                      blocSearchBook.add(SearchBookEvent(nameBook: bookModel.book, list: list));
                    },
                    icon: const Icon(Icons.search)
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<BlocSearchBook, BlocState>(
            bloc: blocSearchBook,
            builder: (context, state){
              if(state is SearchBookLoadingState){
                return const LoadinComponent();
              }
              else if(state is SearchBookErrorState){
                return Text(state.message);
              }
              else if(state is SearchBookSucessState){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Align(alignment: Alignment.centerLeft,child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Livro Encontrado', style: TextStyle(fontSize: 16),),
                      )),
                      GestureDetector(
                        onTap: () {
                          blocSearchBook.add(SearchBookInitialEvent());
                          if(state.data.chapters! > 1){
                            Modular.to.pushNamed(RoutesApp.listChapters, arguments: state.data);
                          }
                          else{
                            Modular.to.pushNamed(RoutesApp.showChapters, arguments: {
                              'book' : state.data,
                              'chapter' : (state.data.chapters).toString(),
                            });
                          }
                        },
                        child: ShowBook(bookModel: state.data)
                      ),
                    ],
                  ),
                );
              }
              if(state is SearchBookInitial){
                return Container();
              }
              return Container();
            }
          ),
        ],
      ),
    );
  }
}