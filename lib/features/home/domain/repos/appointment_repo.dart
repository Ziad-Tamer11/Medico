import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, void>> createAppointment({
    required AppointmentEntity appointment,
  });

  Future<Either<Failure, List<AppointmentEntity>>> getUpcomingAppointments({
    required String patientId,
  });
}
