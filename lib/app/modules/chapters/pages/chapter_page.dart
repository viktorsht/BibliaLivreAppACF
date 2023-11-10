import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/components/widgets/erro_component.dart';
import 'package:holy_bible/app/models/books_model.dart';
import 'package:holy_bible/app/modules/chapters/pages/components/show_verse.dart';

import '../../../components/widgets/app_bar_component.dart';
import '../../../components/widgets/loading_component.dart';
import '../bloc/bloc_chapter.dart';

class ChapterPage extends StatefulWidget {
  final BookModel book;
  final String chapter;

  const ChapterPage({
    super.key, 
    required this.book, 
    required this.chapter, 
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {

  final BlocChapter blocChapter = Modular.get<BlocChapter>();
  @override
  void initState() {
    super.initState();
    blocChapter.add(ShowChapterEvent(book: (widget.book.id! - 1).toString(), chapter: widget.chapter));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.book.name}',
      ),
      body: BlocBuilder(
        bloc: blocChapter,
        builder: (context, state){
          if(state is ShowChapterErrorState){
            return ErroComponent(errorMessage: state.message);
          }
          else if(state is ShowChapterSucessState){
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        int numero = state.data.id ?? 0;
                        if(numero > 1){
                          blocChapter.add(ShowChapterEvent(
                            book: (widget.book.id! - 1).toString(), 
                            chapter: (numero-1).toString())
                          );
                        }
                      },
                    ),
                    Text(
                      'Capítulo ${state.data.id}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        int numero = state.data.id ?? 0;
                        if(numero < widget.book.chapters!){
                          blocChapter.add(ShowChapterEvent(
                            book: (widget.book.id! - 1).toString(), 
                            chapter: (numero+1).toString())
                          );
                        }
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: state.data.verse!.length,
                      itemBuilder: (context, index){
                        return ShowVerse(
                          numVerse: state.data.verse![index].verse!.toString(),
                          text: state.data.verse![index].text!
                        );
                      }
                    ),
                  ),
                ),
              ],
            );
          }
          return const LoadinComponent();
        }
      ),
    );
  }
}