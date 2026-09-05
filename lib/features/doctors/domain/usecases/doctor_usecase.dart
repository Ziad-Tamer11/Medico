import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';
import 'package:medico/features/doctors/domain/repos/doctor_repo.dart';

class DoctorUsecase {
  final DoctorRepo doctorRepo;

  DoctorUsecase({required this.doctorRepo});

  Future<Either<Failure, List<DoctorEntity>>> getDoctors() {
    return doctorRepo.getDoctors();
  }

  Future<Either<Failure, DoctorEntity>> getDoctorById({
    required int doctorId,
  }) {
    return doctorRepo.getDoctorById(doctorId: doctorId);
  }

  Future<Either<Failure, List<DoctorEntity>>> getDoctorsByCategory({
    required int categoryId,
  }) {
    return doctorRepo.getDoctorsByCategory(categoryId: categoryId);
  }

  Future<Either<Failure, List<DoctorEntity>>> searchDoctors({
    required String query,
  }) {
    return doctorRepo.searchDoctors(query: query);
  }
}
