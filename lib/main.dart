import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medico/core/manager/app_user_cubit/app_user_cubit.dart';
import 'package:medico/core/services/custom_bloc_observer.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/api_keys.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishablekey;
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _ensureFirestoreAccess();
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '883391731424-afmt194hmpgjpn5qr1lur7dd4h4itfac.apps.googleusercontent.com',
  );
  setUpGetIt();
  getIt<AppUserCubit>().refresh();
  runApp(const Medico());
}

// Firestore rules require an authenticated Firebase user; this app's real
// identity lives entirely in our own backend, so this stays a fully separate,
// anonymous Firebase session with no link to that user — just to unlock reads.
Future<void> _ensureFirestoreAccess() async {
  if (FirebaseAuth.instance.currentUser != null) return;
  try {
    await FirebaseAuth.instance.signInAnonymously();
  } catch (e) {
    log('Anonymous Firebase sign-in failed: ${e.toString()}');
  }
}

class Medico extends StatelessWidget {
  const Medico({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppUserCubit>.value(
      value: getIt<AppUserCubit>(),
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoute.router,
      ),
    );
  }
}
