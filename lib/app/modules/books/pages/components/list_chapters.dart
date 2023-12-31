import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

import '../../../../components/widgets/app_bar_component.dart';

class ListChapters extends StatelessWidget {
  final BookModel book;
  const ListChapters({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: book.name!,
        //onBackPressed: () => Modular.to.navigate(RoutesApp.root),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Número de colunas na grade
            mainAxisSpacing: 10.0, // Espaçamento vertical entre os itens
            crossAxisSpacing: 10.0, // Espaçamento horizontal entre os itens
            childAspectRatio: 1.0, // Proporção da largura para a altura dos itens
          ),
          itemCount: book.chapters, 
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () => Modular.to.pushNamed(RoutesApp.showChapters, arguments: {
                'book' : book,
                'chapter' : (index+1).toString(),
              }),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // Define o raio de borda arredondada
                  color: Theme.of(context).colorScheme.background
                ),
                child: Center(
                  child: Text(
                    "${index+1}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,//ColorsApp.darkColorText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}