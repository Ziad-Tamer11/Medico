import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/database_service.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/home/data/models/doctor_model.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/repos/doctor_repo.dart';

class DoctorRepoImpl extends DoctorRepo {
  final DatabaseService databaseService;

  DoctorRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      var data = await databaseService.getCollectionData(
        path: BackendEndpoints.doctors,
      );
      final doctors = data.map((json) => DoctorModel.fromJson(json)).toList();
      return right(doctors);
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
