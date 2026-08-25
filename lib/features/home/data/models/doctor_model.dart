import 'package:medico/features/home/domain/entities/doctor_entity.dart';

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
    required super.categoryId,
  });

  // The backend's `name` field bundles the title and specialty into one
  // string, e.g. "DR. Bassem Raafat - Consultant Cardiology". Split it once
  // here into a clean display name and a clean specialty.
  static final _nameWithSpecialtyPattern = RegExp(
    r'^dr\.?\s*(.+?)\s*-\s*consultant\s+(.+)$',
    caseSensitive: false,
  );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final rawName = (json['name'] as String).trim();
    final match = _nameWithSpecialtyPattern.firstMatch(rawName);
    final name = match != null ? match.group(1)!.trim() : rawName;
    final specialty = match != null ? match.group(2)!.trim() : '';

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
      categoryId: json['category_id'],
    );
  }
}
