import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/doctors/domain/usecases/doctor_usecase.dart';
import 'package:medico/features/doctors/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DoctorCubit(doctorUsecase: getIt<DoctorUsecase>()),
        child: const SearchViewBody(),
      ),
    );
  }
}
