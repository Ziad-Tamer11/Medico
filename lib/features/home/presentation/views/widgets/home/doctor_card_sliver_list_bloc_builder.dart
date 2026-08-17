import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card_sliver_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorCardSliverListBlocBuilder extends StatelessWidget {
  const DoctorCardSliverListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return Skeletonizer.sliver(
            child: DoctorCardSliverList(doctors: getDummyDoctors()),
          );
        }
        if (state is DoctorFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }
        if (state is DoctorSuccess) {
          return DoctorCardSliverList(doctors: state.doctorEntity);
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
