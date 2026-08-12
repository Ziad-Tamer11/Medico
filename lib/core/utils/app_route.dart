import 'package:go_router/go_router.dart';
import 'package:medico/features/auth/presentation/views/login_view.dart';
import 'package:medico/features/auth/presentation/views/sign_up_view.dart';
import 'package:medico/features/home/presentation/views/all_doctors_view.dart';
import 'package:medico/features/home/presentation/views/doctors_by_category_view.dart';
import 'package:medico/features/home/presentation/views/main_view.dart';
import 'package:medico/features/home/presentation/views/all_categories_view.dart';
import 'package:medico/features/home/presentation/views/my_favorites_view.dart';
import 'package:medico/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kHomeView = '/homeView';
  static const kAllCategoriesView = '/allCategoriesView';
  static const kDoctorsByCategoryView = '/doctorsByCategotyView';
  static const kAllDoctorsView = '/allDoctorsView';
  static const kMyFavoritesView = '/myFavoritesView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
      GoRoute(path: kHomeView, builder: (context, state) => MainView()),
      GoRoute(
        path: kAllCategoriesView,
        builder: (context, state) => AllCategoriesView(),
      ),
      GoRoute(
        path: kDoctorsByCategoryView,
        builder: (context, state) => DoctorsByCategoryView(),
      ),
      GoRoute(
        path: kAllDoctorsView,
        builder: (context, state) => AllDoctorsView(),
      ),
      GoRoute(
        path: kMyFavoritesView,
        builder: (context, state) => MyFavoritesView(),
      ),
    ],
  );
}
