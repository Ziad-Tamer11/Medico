import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';

abstract class DoctorRepo {
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();

  Future<Either<Failure, DoctorEntity>> getDoctorById({
    required int doctorId,
  });

  Future<Either<Failure, List<DoctorEntity>>> getDoctorsByCategory({
    required int categoryId,
  });

  Future<Either<Failure, List<DoctorEntity>>> searchDoctors({
    required String query,
  });
}
