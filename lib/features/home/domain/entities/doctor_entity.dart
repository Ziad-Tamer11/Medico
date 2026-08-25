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
  final int categoryId;

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
    required this.categoryId,
  });
}
