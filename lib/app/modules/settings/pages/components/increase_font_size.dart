import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_bible/app/modules/settings/cubit/increase_font_size_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';

class IncreaseFontSizeComponent extends StatefulWidget {
  const IncreaseFontSizeComponent({super.key});

  @override
  State<IncreaseFontSizeComponent> createState() => _IncreaseFontSizeComponentState();
}

class _IncreaseFontSizeComponentState extends State<IncreaseFontSizeComponent> {
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
                    thumbColor: Theme.of(context).brightness == Brightness.dark 
                      ? Theme.of(context).colorScheme.secondary 
                      : Theme.of(context).colorScheme.primary,
                    activeColor: Theme.of(context).colorScheme.background ,
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
