import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/books/bloc/bloc_books.dart';

class ListBooksPage extends StatefulWidget {
  const ListBooksPage({super.key});

  @override
  State<ListBooksPage> createState() => _ListBooksPageState();
}

class _ListBooksPageState extends State<ListBooksPage> {

  final BlocBooks blocBooks = Modular.get<BlocBooks>();

  @override
  void initState() {
    super.initState();
    blocBooks.add(SearchListBooksEvent());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BlocBooks, BlocState>(
        builder: (context, state) {
          if(state is SearchBooksLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is SearchBooksErrorState){
            return Center(child: Text(state.message),);
          }
          else if(state is SearchBooksSucessState){
            return Center(
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(state.data[index].name!),
                  );
                }
              )
            );
          }
          return Container();
        },
      ),
    );
  }
}