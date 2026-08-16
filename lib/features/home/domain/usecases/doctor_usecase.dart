import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/repos/doctor_repo.dart';

class DoctorUsecase {
  final DoctorRepo doctorRepo;

  DoctorUsecase({required this.doctorRepo});
  Future<Either<Failure, List<DoctorEntity>>> getCategories() {
    return doctorRepo.getDoctors();
  }
}
