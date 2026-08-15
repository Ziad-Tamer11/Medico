import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
