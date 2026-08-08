import 'package:go_router/go_router.dart';
import 'package:medico/features/auth/presentation/views/login_view.dart';
import 'package:medico/features/auth/presentation/views/sign_up_view.dart';
import 'package:medico/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
    ],
  );
}
