import 'package:medico/features/home/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required super.id,
    required super.doctorId,
    super.doctorName,
    required super.date,
    required super.startTime,
    required super.endTime,
    required super.createdAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['appointment_id'],
      doctorId: json['doctor_id'],
      doctorName: json['doctor_name'],
      date: DateTime.parse(json['appointment_date']),
      startTime: json['start_time'],
      endTime: json['end_time'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
