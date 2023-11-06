import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/constants/buttons.dart';
import 'package:holy_bible/app/modules/books/models/books_model.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

import '../../../../constants/colors_app.dart';

class ListBooks extends StatelessWidget {
  final List<BookModel> list;
  const ListBooks({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index){
        return ElevatedButton(
          style: CustomElevatedButtonStyle.primaryButtonStyle,
          onPressed: () {
            Modular.to.navigate(RoutesApp.listChapters, arguments: list[index]);
          },
          child: Center(
            child: Text(
              list[index].name!,
              style: TextStyle(
                fontSize: 18,
                color: ColorsApp.darkColorText,
              ),
            )
          ),
        );
      }
    );
  }
}