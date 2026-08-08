import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_route.dart';

void main() {
  runApp(const Medico());
}

class Medico extends StatelessWidget {
  const Medico({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
    );
  }
}
