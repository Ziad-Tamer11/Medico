import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctors_by_category_view_body.dart';

class DoctorsByCategoryView extends StatelessWidget {
  const DoctorsByCategoryView({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    // safe/idempotent — see home_view.dart; this screen shows doctor cards
    // with favorite hearts too, so favorites need to be ready here as well
    if (getIt<AuthUsecase>().isLoggedIn()) {
      getIt<FavoriteCubit>().loadFavorites();
    }
    return Scaffold(
      appBar: buildCustomAppBar(context, title: categoryEntity.name),
      body: BlocProvider(
        create: (context) =>
            DoctorCubit(doctorUsecase: getIt<DoctorUsecase>())
              ..getDoctorsByCategory(categoryEntity.id),
        child: const DoctorsByCategoryViewBody(),
      ),
    );
  }
}
