import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/repos/appointment_repo.dart';

class AppointmentUseCase {
  final AppointmentRepo appointmentRepo;

  AppointmentUseCase({required this.appointmentRepo});

  Future<Either<Failure, void>> createAppointment({
    required AppointmentEntity appointment,
  }) {
    return appointmentRepo.createAppointment(appointment: appointment);
  }

  Future<Either<Failure, List<AppointmentEntity>>> getUpcomingAppointments({
    required String patientId,
  }) {
    return appointmentRepo.getUpcomingAppointments(patientId: patientId);
  }
}
