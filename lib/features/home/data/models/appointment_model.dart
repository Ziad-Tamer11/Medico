import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required super.id,
    required super.patientId,
    required super.doctorId,
    required super.doctorName,
    required super.date,
    required super.time,
    required super.amount,
    required super.status,
    required super.paymentStatus,
  });

  factory AppointmentModel.fromEntity(AppointmentEntity entity) {
    return AppointmentModel(
      id: entity.id,
      patientId: entity.patientId,
      doctorId: entity.doctorId,
      doctorName: entity.doctorName,
      date: entity.date,
      time: entity.time,
      amount: entity.amount,
      status: entity.status,
      paymentStatus: entity.paymentStatus,
    );
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    final rawDate = json['date'];
    DateTime date;
    if (rawDate is Timestamp) {
      date = rawDate.toDate();
    } else if (rawDate is DateTime) {
      date = rawDate;
    } else if (rawDate is String) {
      date = DateTime.parse(rawDate);
    } else {
      throw const FormatException('Invalid appointment date');
    }
    return AppointmentModel(
      id: json['id'] ?? '',
      patientId: json['patientId'] ?? '',
      doctorId: json['doctorId'] ?? '',
      doctorName: json['doctorName'] ?? '',
      date: date,
      time: json['time'] ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'date': Timestamp.fromDate(date),
      'time': time,
      'amount': amount,
      'status': status,
      'paymentStatus': paymentStatus,
    };
  }
}
