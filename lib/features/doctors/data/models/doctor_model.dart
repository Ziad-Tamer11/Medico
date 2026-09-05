import 'package:medico/features/doctors/data/models/doctor_availability_model.dart';
import 'package:medico/features/doctors/data/models/doctor_working_hours_model.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.name,
    required super.specialty,
    super.image,
    super.workPlace,
    super.experience,
    required super.treated,
    required super.hourlyRate,
    required super.rating,
    required super.isActive,
    required super.categoryName,
    super.workingHours,
    super.availability,
  });

  // The backend's `name` field bundles the display name and specialty into
  // one string, e.g. "Moataz Salah, Cardiology". Split it once here on the
  // first comma into a clean display name and a clean specialty.
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final rawName = (json['name'] as String).trim();
    final commaIndex = rawName.indexOf(',');
    final name = commaIndex == -1
        ? rawName
        : rawName.substring(0, commaIndex).trim();
    final specialty = commaIndex == -1
        ? ''
        : rawName.substring(commaIndex + 1).trim();

    return DoctorModel(
      id: json['doctor_id'],
      name: name,
      specialty: specialty,
      image: json['image'],
      workPlace: json['work_place'],
      experience: json['experience'],
      treated: json['treated'] ?? 0,
      hourlyRate: (json['price'] as num).toDouble(),
      rating: (json['average_rating'] as num).toDouble(),
      isActive: json['is_active'] ?? true,
      categoryName: json['category_name'] ?? '',
      workingHours: (json['working_hours'] as List? ?? [])
          .map((e) => DoctorWorkingHoursModel.fromJson(e))
          .toList(),
      availability: (json['availability'] as List? ?? [])
          .map((e) => DoctorAvailabilityModel.fromJson(e))
          .toList(),
    );
  }
}
