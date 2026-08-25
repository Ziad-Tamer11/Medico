class AppointmentEntity {
  final int id;
  final int doctorId;
  final String doctorName;
  final DateTime date;
  final String startTime;
  final String endTime;
  final DateTime createdAt;

  const AppointmentEntity({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
  });
}
