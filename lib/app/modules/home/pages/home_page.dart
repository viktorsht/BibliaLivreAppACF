import 'package:flutter/material.dart';
import 'package:holy_bible/app/modules/home/pages/drawer_page.dart';
import '../../../components/widgets/app_bar_component.dart';
import '../../books/pages/books_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Biblia Sagrada ACF Livre',
      ),
      drawer: DrawerPage(),
      body:BooksPage()
    );
  }
}