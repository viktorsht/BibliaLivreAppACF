import 'package:flutter/material.dart';
import 'package:holy_bible/app/constants/colors_app.dart';

class LoadinComponent extends StatelessWidget {
  const LoadinComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorsApp.primaryColor,
      ),
    );
  }
}