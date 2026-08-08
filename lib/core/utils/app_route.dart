import 'package:go_router/go_router.dart';
import 'package:medico/features/auth/presentation/views/login_view.dart';
import 'package:medico/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  static const kLoginView = '/loginView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    ],
  );
}
