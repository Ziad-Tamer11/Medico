import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/doctor_api_service.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/repos/doctor_repo.dart';

class DoctorRepoImpl implements DoctorRepo {
  final DoctorApiService doctorApiService;

  DoctorRepoImpl({required this.doctorApiService});

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      final doctors = await doctorApiService.getDoctors();
      return right(doctors);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in DoctorRepoImpl.getDoctors: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, DoctorEntity>> getDoctorById({
    required int doctorId,
  }) async {
    try {
      final doctor = await doctorApiService.getDoctorById(doctorId: doctorId);
      return right(doctor);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in DoctorRepoImpl.getDoctorById: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsByCategory({
    required int categoryId,
  }) async {
    try {
      final doctors = await doctorApiService.getDoctorsByCategory(
        categoryId: categoryId,
      );
      return right(doctors);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in DoctorRepoImpl.getDoctorsByCategory: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> searchDoctors({
    required String query,
  }) async {
    try {
      final doctors = await doctorApiService.searchDoctors(query: query);
      return right(doctors);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in DoctorRepoImpl.searchDoctors: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
