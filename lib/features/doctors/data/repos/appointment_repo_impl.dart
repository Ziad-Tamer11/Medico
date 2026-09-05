import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/appointment_api_service.dart';
import 'package:medico/features/doctors/domain/entities/appointment_entity.dart';
import 'package:medico/features/doctors/domain/repos/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final AppointmentApiService appointmentApiService;

  AppointmentRepoImpl({required this.appointmentApiService});

  @override
  Future<Either<Failure, AppointmentEntity>> createAppointment({
    required int doctorId,
    required DateTime appointmentDate,
    required String startTime,
    required String endTime,
    required String paymentIntentId,
  }) async {
    try {
      final appointment = await appointmentApiService.createAppointment(
        doctorId: doctorId,
        appointmentDate: appointmentDate,
        startTime: startTime,
        endTime: endTime,
        paymentIntentId: paymentIntentId,
      );
      return right(appointment);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in AppointmentRepoImpl.createAppointment: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getMyAppointments() async {
    try {
      final appointments = await appointmentApiService.getMyAppointments();
      return right(appointments);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in AppointmentRepoImpl.getMyAppointments: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment({
    required int appointmentId,
  }) async {
    try {
      await appointmentApiService.cancelAppointment(
        appointmentId: appointmentId,
      );
      return right(null);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in AppointmentRepoImpl.cancelAppointment: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
