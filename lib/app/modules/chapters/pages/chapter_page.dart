import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/chapters/pages/components/show_verse.dart';
import 'package:holy_bible/app/routes/routes_app.dart';

import '../../../components/app_bar_component.dart';
import '../bloc/bloc_chapter.dart';

class ChapterPage extends StatefulWidget {
  final String book;
  final String numBook;
  final String chapter;
  const ChapterPage({super.key, required this.book, required this.chapter, required this.numBook});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {

  final BlocChapter blocChapter = Modular.get<BlocChapter>();
  @override
  void initState() {
    super.initState();
    blocChapter.add(ShowChapterEvent(book: widget.numBook, chapter: widget.chapter));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.book} Cap ${widget.chapter}',
        onBackPressed: () => Modular.to.navigate(RoutesApp.root),
      ),
      body: BlocBuilder(
        bloc: blocChapter,
        builder: (context, state){
          if(state is ShowChapterErrorState){
            return Center(child: Text(state.message));
          }
          else if(state is ShowChapterSucessState){
            return Padding(
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
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}