import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.name,
    required super.specialization,
    required super.workPlace,
    required super.rating,
    required super.experience,
    required super.hourlyRate,
    required super.treated,
    required super.availableDays,
    required super.availableHours,
    required super.categoryId,
  });

  factory DoctorModel.fromEntity(DoctorEntity entity) {
    return DoctorModel(
      id: entity.id,
      name: entity.name,
      specialization: entity.specialization,
      workPlace: entity.workPlace,
      rating: entity.rating,
      experience: entity.experience,
      hourlyRate: entity.hourlyRate,
      treated: entity.treated,
      availableDays: entity.availableDays,
      availableHours: entity.availableHours,
      categoryId: entity.categoryId,
    );
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      workPlace: json['workPlace'] ?? '',
      rating: json['rating'] ?? '',
      experience: json['experience'] ?? 0,
      hourlyRate: (json['hourlyRate'] ?? 0).toDouble(),
      treated: json['treated'] ?? 0,
      availableDays: List<String>.from(json['availableDays'] ?? []),
      availableHours: List<String>.from(json['availableHours'] ?? []),
      categoryId: json['categoryId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'workPlace': workPlace,
      'rating': rating,
      'experience': experience,
      'hourlyRate': hourlyRate,
      'treated': treated,
      'availableDays': availableDays,
      'availableHours': availableHours,
      'categoryId': categoryId,
    };
  }
}
