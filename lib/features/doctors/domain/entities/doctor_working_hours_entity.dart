class DoctorWorkingHoursEntity {
  final int id;
  final int doctorId;
  // 0 = Monday .. 6 = Sunday, matching the backend's convention.
  final int dayOfWeek;
  final String startTime;
  final String endTime;

  const DoctorWorkingHoursEntity({
    required this.id,
    required this.doctorId,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });
}
