import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

import '../../../../constants/colors_app.dart';
import 'name_book_component.dart';

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
            child: Container(
              height: 55, // Altura do container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), // Borda arredondada
                color: ColorsApp.buttonColor, // Cor cinza claro
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NameBookComponent(name: list[index].name!, abbrev: list[index].abbrev!.toUpperCase(),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list[index].chapters! > 1 ? '${list[index].chapters} Capítulos' : '${list[index].chapters} Capítulo',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsApp.darkColorText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}