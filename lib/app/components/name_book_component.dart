import 'package:flutter/material.dart';

import '../constants/colors_app.dart';

class NameBookComponent extends StatelessWidget {
  final String name;
  final String abbrev;
  const NameBookComponent({super.key, required this.name, required this.abbrev});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CircleAvatar(
            backgroundColor: ColorsApp.primaryColor,
            child: Text(
              abbrev,
              style: TextStyle(
                fontSize: 16,
                color: ColorsApp.lightColorText,
              ), 
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            color: ColorsApp.darkColorText,
          ),
        ),
      ],
    );
  }
}