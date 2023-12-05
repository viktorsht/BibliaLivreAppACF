import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../settings/cubit/increase_font_size_cubit.dart';

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
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            numVerse,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<IncreaseFontSizeCubit, double>(
          builder: (context, state) {
            return Expanded(
              child: SelectableText(
                text,
                style: TextStyle(
                  fontSize: state,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
