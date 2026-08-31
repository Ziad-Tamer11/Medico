import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/features/home/presentation/manager/doctor_details_cubit/doctor_details_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_working_hours.dart';

// Reuses the same DoctorDetailsCubit instance already provided higher up
// the tree - no extra fetch, just reads whatever state it's already in.
// Renders nothing until the doctor (with its working hours) has loaded.
class DoctorWorkingHoursBlocBuilder extends StatelessWidget {
  const DoctorWorkingHoursBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsSuccess) {
          return DoctorWorkingHours(workingHours: state.doctor.workingHours);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
