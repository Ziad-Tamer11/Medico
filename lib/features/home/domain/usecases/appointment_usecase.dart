import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/repos/appointment_repo.dart';

class AppointmentUseCase {
  final AppointmentRepo appointmentRepo;

  AppointmentUseCase({required this.appointmentRepo});

  Future<Either<Failure, AppointmentEntity>> createAppointment({
    required int doctorId,
    required DateTime appointmentDate,
    required String startTime,
    required String endTime,
    required String paymentIntentId,
  }) {
    return appointmentRepo.createAppointment(
      doctorId: doctorId,
      appointmentDate: appointmentDate,
      startTime: startTime,
      endTime: endTime,
      paymentIntentId: paymentIntentId,
    );
  }

  Future<Either<Failure, List<AppointmentEntity>>> getMyAppointments() {
    return appointmentRepo.getMyAppointments();
  }

  Future<Either<Failure, void>> cancelAppointment({
    required int appointmentId,
  }) {
    return appointmentRepo.cancelAppointment(appointmentId: appointmentId);
  }
}
