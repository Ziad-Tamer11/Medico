class AppointmentEntity {
  final int id;
  final int doctorId;
  // present when listing (GET /appointments/me -> UserAppointmentOut), null
  // right after booking (POST /appointments -> AppointmentOut has no join)
  final String? doctorName;
  final DateTime date;
  final String startTime;
  final String endTime;
  final DateTime createdAt;

  const AppointmentEntity({
    required this.id,
    required this.doctorId,
    this.doctorName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
  });
}
