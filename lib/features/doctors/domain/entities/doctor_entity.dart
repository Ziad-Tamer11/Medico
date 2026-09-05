import 'package:medico/features/doctors/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/doctors/domain/entities/doctor_working_hours_entity.dart';

class DoctorEntity {
  final int id;
  final String name;
  final String specialty;
  final String? image;
  final String? workPlace;
  final int? experience;
  final int treated;
  final double hourlyRate;
  final double rating;
  final bool isActive;
  final String categoryName;
  final List<DoctorWorkingHoursEntity> workingHours;
  final List<DoctorAvailabilityEntity> availability;

  const DoctorEntity({
    required this.id,
    required this.name,
    required this.specialty,
    this.image,
    this.workPlace,
    this.experience,
    required this.treated,
    required this.hourlyRate,
    required this.rating,
    required this.isActive,
    required this.categoryName,
    this.workingHours = const [],
    this.availability = const [],
  });
}
