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
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishablekey;
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '883391731424-afmt194hmpgjpn5qr1lur7dd4h4itfac.apps.googleusercontent.com',
  );
  setUpGetIt();
  getIt<AppUserCubit>().refresh();
  if (getIt<AuthUsecase>().isLoggedIn()) {
    getIt<FavoriteCubit>().loadFavorites();
  }
  // categories/doctors are public data — fetched once here and reused by
  // every screen via the shared singleton, instead of every screen
  // re-fetching them from scratch each time it's visited
  getIt<CategoryCubit>().getCategories();
  getIt<DoctorCubit>().getDoctor();
  runApp(const Medico());
}

class Medico extends StatelessWidget {
  const Medico({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppUserCubit>.value(value: getIt<AppUserCubit>()),
        BlocProvider<FavoriteCubit>.value(value: getIt<FavoriteCubit>()),
      ],
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
