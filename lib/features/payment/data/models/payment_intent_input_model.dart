class PaymentIntentInputModel {
  final int doctorId;
  final DateTime appointmentDate;
  final String startTime;
  final String endTime;

  PaymentIntentInputModel({
    required this.doctorId,
    required this.appointmentDate,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() {
    final year = appointmentDate.year.toString().padLeft(4, '0');
    final month = appointmentDate.month.toString().padLeft(2, '0');
    final day = appointmentDate.day.toString().padLeft(2, '0');
    return {
      'doctor_id': doctorId,
      'appointment_date': '$year-$month-$day',
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}
