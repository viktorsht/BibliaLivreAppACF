import 'package:flutter/material.dart';
import 'package:holy_bible/app/models/books_model.dart';

import 'name_book_component.dart';

class ShowBook extends StatelessWidget {
  final BookModel bookModel;
  const ShowBook({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, // Altura do container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), // Borda arredondada
        color: Theme.of(context).colorScheme.background //ColorsApp.buttonColor, // Cor cinza claro
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NameBookComponent(name: bookModel.name!, abbrev: bookModel.abbrev!.toUpperCase(),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bookModel.chapters! > 1 ? '${bookModel.chapters} Cap.' : '${bookModel.chapters} Cap.',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSecondary //ColorsApp.darkColorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}