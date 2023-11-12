import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/components/widgets/erro_component.dart';
import 'package:holy_bible/app/components/widgets/loading_component.dart';
import 'package:holy_bible/app/modules/about/bloc/bloc_about.dart';

import '../../../components/widgets/app_bar_component.dart';
import '../../../constants/images.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final BlocAbout blocAbout = Modular.get<BlocAbout>();

  @override
  void initState() {
    super.initState();
    blocAbout.add(AboutEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sobre',
      ),
      body: BlocBuilder<BlocAbout, BlocState>(
        bloc: blocAbout,
        builder: (context, state){
          if(state is AboutSucessState){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: screen,
                    height: screen,
                    child: Image.asset(Images.logoWhite)
                  ),
                ),
                Text(
                  state.data.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  state.data.description ?? '',
                  textAlign: TextAlign.center, // Ajuste o fator conforme necessário
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Versão: ${state.data.version}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal
                  )
                ),
              ],
            );
          }
          else if(state is AboutLoadingState){
            return const LoadinComponent();
          }
          else if(state is AboutErrorState){
            return ErroComponent(errorMessage: state.message);
          }
          return Container();
        }
      ),
    );
  }
}