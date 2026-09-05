import 'package:flutter/material.dart';
import 'package:medico/features/doctors/domain/entities/appointment_entity.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/home/upcoming_appointment_item.dart';

class UpcomingAppointmentListView extends StatelessWidget {
  const UpcomingAppointmentListView({
    super.key,
    required this.appointments,
    required this.doctors,
  });

  final List<AppointmentEntity> appointments;
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: appointments.map((appointment) {
          final doctor = doctors.firstWhere(
            (doctor) => doctor.id == appointment.doctorId,
          );
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 250,
              child: UpcomingAppointmentItem(
                appointment: appointment,
                doctor: doctor,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
