import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/features/home/presentation/manager/doctor_availability_cubit/doctor_availability_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_working_hours.dart';

// Reuses the same DoctorAvailabilityCubit instance already provided
// higher up the tree - no extra fetch, just reads whatever state it's
// already in. Renders nothing until the availability list has loaded.
class DoctorWorkingHoursBlocBuilder extends StatelessWidget {
  const DoctorWorkingHoursBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAvailabilityCubit, DoctorAvailabilityState>(
      builder: (context, state) {
        if (state is DoctorAvailabilitySuccess) {
          return DoctorWorkingHours(availability: state.availability);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
