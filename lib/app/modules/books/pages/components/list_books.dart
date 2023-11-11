import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/components/show_book.dart';
import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

class ListBooks extends StatelessWidget {
  final List<BookModel> list;
  const ListBooks({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          child: GestureDetector(
            onTap: () {
              if(list[index].chapters! > 1){
                Modular.to.pushNamed(RoutesApp.listChapters, arguments: list[index]);
              }
              else{
                Modular.to.pushNamed(RoutesApp.showChapters, arguments: {
                  'book' : list[index],
                  'chapter' : (list[index].chapters).toString(),
                });
              }
            }, 
            child: ShowBook(bookModel: list[index]), 
          ),
        );
      }
    );
  }
}