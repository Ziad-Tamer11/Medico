import 'package:go_router/go_router.dart';
import 'package:medico/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  static final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => SplashView())],
  );
}
