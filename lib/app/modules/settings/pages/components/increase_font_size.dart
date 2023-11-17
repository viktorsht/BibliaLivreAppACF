import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/app/constants/colors_app.dart';
import 'package:holy_bible/app/modules/settings/cubit/increase_font_size_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';

class IncreaseFontSizeComponent extends StatefulWidget {
  const IncreaseFontSizeComponent({super.key});

  @override
  State<IncreaseFontSizeComponent> createState() => _IncreaseFontSizeComponentState();
}

class _IncreaseFontSizeComponentState extends State<IncreaseFontSizeComponent> {
  double _value = 1.0;

  void increment(){
    if(_value < 100){
      setState(() {
        _value+=2;
      });
    }
  }

  void decrement(){
    if(_value > 1){
      setState(() {
        _value-=2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    IncreaseFontSizeCubit cubit = Provider.of<IncreaseFontSizeCubit>(context);
    return Row(
      children: [
        IconButton(
          onPressed: cubit.decrement, 
          icon: const Icon(Icons.remove)
        ),
        Expanded(
          child: BlocBuilder<IncreaseFontSizeCubit, double>(
            builder: (context, fontSize){
              return Column(
                children: [
                  Text('Tamanho da fonte: ${fontSize.toInt()}'),
                  Slider(
                    thumbColor: ColorsApp.primaryColor,
                    activeColor: ColorsApp.primaryColor,
                    value: fontSize,
                    max: Constants.fontSizeMax,
                    min: Constants.fontSizeMin,
                    onChanged: (value) {
                      context.read<IncreaseFontSizeCubit>().updateSliderValue(value);
                    },
                  ),
                ],
              );
            } 
          ),
        ),
        IconButton(
          onPressed: cubit.increment, 
          icon: const Icon(Icons.add)
        ),
      ],
    );
  }
}
