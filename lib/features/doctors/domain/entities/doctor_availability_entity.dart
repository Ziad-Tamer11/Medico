class DoctorAvailabilityEntity {
  final int id;
  final int doctorId;
  final DateTime date;
  final String startTime;
  final String endTime;
  final bool isAvailable;

  const DoctorAvailabilityEntity({
    required this.id,
    required this.doctorId,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.isAvailable = true,
  });
}
