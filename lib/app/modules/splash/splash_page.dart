import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:holy_bible/app/routes/routes_app.dart';
//import 'package:connectivity_plus/connectivity_plus.dart'; // Importe a biblioteca de conectividade
import '../../constants/colors_app.dart';
import '../../constants/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  /*@override
  void initState() {
    super.initState();

    checkInternetConnectivity().then((isConnected) {
      if (isConnected) {
        Future.delayed(
          const Duration(milliseconds: 2500),
          () {
            Modular.to.navigate(RoutesApp.listBooks);
          },
        );
      } else {
        Modular.to.navigate(RoutesApp.noInternet);
        // Trate o caso de não haver conectividade com a internet aqui
        // Por exemplo, exibindo uma mensagem de erro ou redirecionando para uma tela de erro.
      }
    });
  }

  Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());   
    return connectivityResult != ConnectivityResult.none;
  }*/

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Modular.to.navigate(RoutesApp.home); // vai ser home
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: Center(
        child: Image.asset(
          Images.logo,
        ),
      ),
    );
  }
}