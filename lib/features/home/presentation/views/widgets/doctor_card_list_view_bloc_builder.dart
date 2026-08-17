import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorCardListViewBlocBuilder extends StatelessWidget {
  const DoctorCardListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return Skeletonizer(
            child: DoctorCardListView(doctors: getDummyDoctors()),
          );
        }
        if (state is DoctorFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is DoctorSuccess) {
          return DoctorCardListView(doctors: state.doctorEntity);
        }
        return SizedBox.shrink();
      },
    );
  }
}
