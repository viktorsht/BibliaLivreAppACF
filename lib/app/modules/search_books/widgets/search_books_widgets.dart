import 'package:flutter/material.dart';
import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/modules/search_books/model/search_book_model.dart';
import 'package:provider/provider.dart';

import '../../../components/widgets/text_form_field_widget.dart';
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
      child: Row(
        children: [
          Expanded(
            child: WidgetFormField(
              hint: 'Procure um livro aqui', 
              value: bookModel.book,
              onChanged: bookModel.setBook,
              suffix: IconButton(
                onPressed: () {
                  blocSearchBook.add(SearchBookEvent(bookModel.book, list));
                },
                icon: const Icon(Icons.search)
              ),
            ),
          ),
        ],
      ),
    );
  }
}