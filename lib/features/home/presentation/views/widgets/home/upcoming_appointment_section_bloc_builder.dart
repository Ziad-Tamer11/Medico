import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/doctors/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/doctors/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/home/upcoming_appointment_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpcomingAppointmentSectionBlocBuilder extends StatelessWidget {
  const UpcomingAppointmentSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetUpcomingAppointmentCubit,
      GetUpcomingAppointmentState
    >(
      builder: (context, appointmentState) {
        if (appointmentState is GetUpcomingAppointmentsLoading) {
          return _loadingSkeleton();
        }
        if (appointmentState is GetUpcomingAppointmentsFailure) {
          return Center(child: Text(appointmentState.errMessage));
        }
        if (appointmentState is GetUpcomingAppointmentsSuccess) {
          if (appointmentState.appointments.isEmpty) {
            return const SizedBox.shrink();
          }
          return BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, doctorState) {
              if (doctorState is DoctorSuccess) {
                return UpcomingAppointmentSection(
                  appointments: appointmentState.appointments,
                  doctors: doctorState.doctorEntity,
                );
              }
              // appointments are ready but doctor details aren't yet -
              // keep showing the skeleton instead of an empty gap
              return _loadingSkeleton();
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _loadingSkeleton() {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        baseColor: Colors.white,
        highlightColor: Colors.white70,
      ),
      child: UpcomingAppointmentSection(
        appointments: getDummyAppointments(),
        doctors: getDummyDoctors(),
      ),
    );
  }
}
