import 'package:flutter/material.dart';
import 'package:medico/features/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const Medico());
}

class Medico extends StatelessWidget {
  const Medico({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
