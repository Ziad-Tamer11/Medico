class AppointmentEntity {
  final String id;
  final String patientId;
  final String doctorId;
  final String doctorName;
  final DateTime date;
  final String time;
  final double amount;
  final String status;
  final String paymentStatus;

  const AppointmentEntity({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.time,
    required this.amount,
    required this.status,
    required this.paymentStatus,
  });
}
