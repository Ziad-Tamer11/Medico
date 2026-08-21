import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:medico/features/home/domain/usecases/category_usecase.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/home/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoryCubit(categoryUsecase: getIt<CategoryUsecase>())
                  ..getCategories(),
          ),
          BlocProvider(
            create: (context) =>
                DoctorCubit(doctorUsecase: getIt<DoctorUsecase>())..getDoctor(),
          ),
          BlocProvider(
            create: (context) =>
                GetUpcomingAppointmentCubit(
                  appointmentUseCase: getIt<AppointmentUseCase>(),
                )..getUpcomingAppointments(
                  patientId: getIt<AuthUsecase>()
                      .getCachedUser()!
                      .userId
                      .toString(),
                ),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
