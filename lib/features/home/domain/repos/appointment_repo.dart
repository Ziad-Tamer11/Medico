import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, AppointmentEntity>> createAppointment({
    required int doctorId,
    required DateTime appointmentDate,
    required String startTime,
    required String endTime,
    required String paymentIntentId,
  });

  Future<Either<Failure, List<AppointmentEntity>>> getMyAppointments();

  Future<Either<Failure, void>> cancelAppointment({
    required int appointmentId,
  });
}
