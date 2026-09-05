import 'package:medico/features/doctors/domain/entities/doctor_working_hours_entity.dart';

class DoctorWorkingHoursModel extends DoctorWorkingHoursEntity {
  const DoctorWorkingHoursModel({
    required super.id,
    required super.doctorId,
    required super.dayOfWeek,
    required super.startTime,
    required super.endTime,
  });

  factory DoctorWorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return DoctorWorkingHoursModel(
      id: json['working_hours_id'],
      doctorId: json['doctor_id'],
      dayOfWeek: json['day_of_week'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
