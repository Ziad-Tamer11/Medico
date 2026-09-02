import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/features/booking/presentation/manager/cancel_appointment_cubit/cancel_appointment_cubit.dart';
import 'package:medico/features/booking/presentation/view/widgets/booking_appointment_item.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';

class UpcomingAppointmentsTab extends StatelessWidget {
  const UpcomingAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelAppointmentCubit, CancelAppointmentState>(
      listener: (context, state) {
        if (state is CancelAppointmentSuccess) {
          showMessageBar(context, 'Appointment cancelled', Colors.green);
          getIt<GetUpcomingAppointmentCubit>().getUpcomingAppointments(
            forceRefresh: true,
          );
        }
        if (state is CancelAppointmentFailure) {
          showMessageBar(context, state.errMessage, AppColor.red);
        }
      },
      child:
          BlocBuilder<GetUpcomingAppointmentCubit, GetUpcomingAppointmentState>(
        builder: (context, appointmentState) {
          if (appointmentState is GetUpcomingAppointmentsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (appointmentState is GetUpcomingAppointmentsFailure) {
            return Center(child: Text(appointmentState.errMessage));
          }
          if (appointmentState is GetUpcomingAppointmentsSuccess) {
            if (appointmentState.appointments.isEmpty) {
              return const Center(
                child: NoResult(text: 'No upcoming appointments'),
              );
            }
            return BlocBuilder<DoctorCubit, DoctorState>(
              builder: (context, doctorState) {
                if (doctorState is! DoctorSuccess) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: appointmentState.appointments.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final appointment = appointmentState.appointments[index];
                    final doctor = _findDoctor(
                      doctorState.doctorEntity,
                      appointment.doctorId,
                    );
                    if (doctor == null) return const SizedBox.shrink();
                    return BookingAppointmentItem(
                      appointment: appointment,
                      doctor: doctor,
                    );
                  },
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  DoctorEntity? _findDoctor(List<DoctorEntity> doctors, int doctorId) {
    for (final doctor in doctors) {
      if (doctor.id == doctorId) return doctor;
    }
    return null;
  }
}
