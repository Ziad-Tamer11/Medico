import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/all_doctors_view_body.dart';

class AllDoctorsView extends StatelessWidget {
  const AllDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    // safe/idempotent — see home_view.dart for why this is called here too
    getIt<DoctorCubit>().getDoctor();
    if (getIt<AuthUsecase>().isLoggedIn()) {
      getIt<FavoriteCubit>().loadFavorites();
    }
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'All Doctors'),
      body: BlocProvider<DoctorCubit>.value(
        value: getIt<DoctorCubit>(),
        child: AllDoctorsViewBody(),
      ),
    );
  }
}
