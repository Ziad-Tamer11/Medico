class DoctorEntity {
  final String id;
  final String name;
  final String specialization;
  final String workPlace;
  final String rating;
  final int experience;
  final double hourlyRate;
  final int treated;
  final List<String> availableDays;
  final List<String> availableHours;
  final String categoryId;

  const DoctorEntity({
    required this.id,
    required this.name,
    required this.specialization,
    required this.workPlace,
    required this.rating,
    required this.experience,
    required this.hourlyRate,
    required this.treated,
    required this.availableDays,
    required this.availableHours,
    required this.categoryId,
  });
}
