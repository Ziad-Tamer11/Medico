import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/database_service.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/home/data/models/category_model.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/repos/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final DatabaseService databaseService;

  CategoryRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      var data = await databaseService.getCollectionData(
        path: BackendEndpoints.categories,
      );
      final categories = data
          .map((json) => CategoryModel.fromJson(json))
          .toList();
      return right(categories);
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
