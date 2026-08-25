import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

abstract class DoctorRepo {
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();

  Future<Either<Failure, List<DoctorEntity>>> getDoctorsByCategory({
    required int categoryId,
  });

  Future<Either<Failure, List<DoctorAvailabilityEntity>>> getDoctorAvailability({
    required int doctorId,
  });
}
