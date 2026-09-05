import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';

class AppointmentSelectionEntity {
  final DoctorEntity doctor;
  final DateTime date;
  final String startTime;
  final String endTime;

  const AppointmentSelectionEntity({
    required this.doctor,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}
