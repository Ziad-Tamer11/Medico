import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class AppointmentSelectionEntity {
  final DoctorEntity doctor;
  final DateTime date;
  final String time;

  const AppointmentSelectionEntity({
    required this.doctor,
    required this.date,
    required this.time,
  });
}
