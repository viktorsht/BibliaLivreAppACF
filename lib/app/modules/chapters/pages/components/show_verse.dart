import 'package:flutter/material.dart';

class ShowVerse extends StatelessWidget {
  final String numVerse;
  final String text;

  const ShowVerse({Key? key, required this.numVerse, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          numVerse,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
