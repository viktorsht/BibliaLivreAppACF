import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_off,
              size: 64,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              "Sem Conexão à Internet",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Verifique sua conexão e tente novamente.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
