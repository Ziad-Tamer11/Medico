import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

abstract class DoctorRepo {
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
}
