import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';

class DoctorAvailabilityModel extends DoctorAvailabilityEntity {
  const DoctorAvailabilityModel({
    required super.id,
    required super.doctorId,
    required super.date,
    required super.startTime,
    required super.endTime,
    super.isAvailable,
  });

  factory DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilityModel(
      id: json['availability_id'],
      doctorId: json['doctor_id'],
      date: DateTime.parse(json['date']),
      startTime: json['start_time'],
      endTime: json['end_time'],
      isAvailable: json['is_available'] ?? true,
    );
  }
}
