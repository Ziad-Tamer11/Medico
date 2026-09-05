import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/category_api_service.dart';
import 'package:medico/features/doctors/domain/entities/category_entity.dart';
import 'package:medico/features/doctors/domain/repos/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryApiService categoryApiService;

  CategoryRepoImpl({required this.categoryApiService});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await categoryApiService.getCategories();
      return right(categories);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in CategoryRepoImpl.getCategories: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
