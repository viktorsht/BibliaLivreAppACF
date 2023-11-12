import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/modules/about/bloc/bloc_about.dart';

import '../../../components/widgets/app_bar_component.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sobre',
      ),
      body: BlocBuilder<BlocAbout, BlocState>(
        bloc: blocAbout,
        builder: (context, state){
          if(state is AboutSucessState){
            return Text(state.data.name ?? 'Erro');
          }
          else if(state is AboutErrorState){
            return Text(state.message);
          }
          return Container();
        }
      ),
    );
  }
}