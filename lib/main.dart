import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medico/core/services/custom_bloc_observer.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '1005135440777-7nv4d33vumht7l8mhrbk1jqocp1sgfb0.apps.googleusercontent.com',
  );
  setUpGetIt();
  runApp(const Medico());
}

class Medico extends StatelessWidget {
  const Medico({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
    );
  }
}
