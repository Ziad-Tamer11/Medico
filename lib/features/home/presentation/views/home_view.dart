import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/features/home/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/home/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Safe to call every time this screen builds: each cubit skips the
    // fetch if its data is already loaded, so this only ever does real work
    // once — and gives a natural retry if the very first attempt (kicked
    // off in main.dart) failed, e.g. no internet at cold start.
    getIt<CategoryCubit>().getCategories();
    getIt<DoctorCubit>().getDoctor();
    if (getIt<AuthUsecase>().isLoggedIn()) {
      getIt<FavoriteCubit>().loadFavorites();
      // forced here (unlike the plain call at cold start/login) so every
      // Home visit shows a real loading state and picks up anything
      // booked/cancelled since the last visit, not just a cached list
      getIt<GetUpcomingAppointmentCubit>().getUpcomingAppointments(
        forceRefresh: true,
      );
    }
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>.value(value: getIt<CategoryCubit>()),
          BlocProvider<DoctorCubit>.value(value: getIt<DoctorCubit>()),
          BlocProvider<GetUpcomingAppointmentCubit>.value(
            value: getIt<GetUpcomingAppointmentCubit>(),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
