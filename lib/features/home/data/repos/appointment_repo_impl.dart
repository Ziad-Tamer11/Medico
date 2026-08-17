import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/database_service.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/home/data/models/appointment_model.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/repos/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final DatabaseService databaseService;

  AppointmentRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> createAppointment({
    required AppointmentEntity appointment,
  }) async {
    try {
      final appointmentModel = AppointmentModel.fromEntity(appointment);

      await databaseService.addData(
        path: BackendEndpoints.appointments,
        documentId: appointment.id,
        data: appointmentModel.toMap(),
      );
      return right(null);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getUpcomingAppointments({
    required String patientId,
  }) async {
    try {
      final data = await databaseService.getCollectionData(
        path: BackendEndpoints.appointments,
      );
      final appointments = data
          .map((json) => AppointmentModel.fromJson(json))
          .where(
            (appointment) =>
                appointment.patientId == patientId &&
                appointment.date.isAfter(DateTime.now()),
          )
          .toList();
      return right(appointments);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
