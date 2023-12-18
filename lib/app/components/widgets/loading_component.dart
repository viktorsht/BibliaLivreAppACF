import 'package:flutter/material.dart';

class LoadinComponent extends StatelessWidget {
  const LoadinComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).brightness == Brightness.dark 
        ? Theme.of(context).colorScheme.secondary 
        : Theme.of(context).colorScheme.primary
      ),
    );
  }
}