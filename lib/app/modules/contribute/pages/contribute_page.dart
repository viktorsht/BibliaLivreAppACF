import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:holy_bible/app/components/widgets/app_bar_component.dart';
import 'package:holy_bible/app/constants/colors_app.dart';
import 'package:holy_bible/app/constants/constants.dart';

import '../../../constants/images.dart';
import '../cubit/contribute_cubit.dart';
import '../cubit/contribute_state.dart';

class ContributePage extends StatelessWidget {
  const ContributePage({super.key});

  @override
  Widget build(BuildContext context) {

    double screen = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Apoie'),
      body: Center(
        child: BlocProvider(
          create: (context) => ClipboardCubit(),
          child: BlocBuilder<ClipboardCubit, ClipboardState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Contribua com este projeto!',
                    style: TextStyle(fontSize: 22),
                  ),
                  const Text(
                    'Ajude-nos a atingir mais pessoas!',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    width: screen,
                    height: screen,
                    child: Image.asset(Images.charity)
                  ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.read<ClipboardCubit>().copyToClipboard(Constants.keyPix);
                    Fluttertoast.showToast(
                      msg: 'Chave pix copiada!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: ColorsApp.primaryColor,
                      textColor: ColorsApp.secundaryColor,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: ColorsApp.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Quero doar', style: TextStyle(fontSize: 18, color: ColorsApp.secundaryColor),),
                        const SizedBox(width: 8,),
                        Icon(Icons.pix, color: Theme.of(context).colorScheme.onPrimary,),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}