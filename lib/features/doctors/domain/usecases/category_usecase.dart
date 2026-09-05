import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/doctors/domain/entities/category_entity.dart';
import 'package:medico/features/doctors/domain/repos/category_repo.dart';

class CategoryUsecase {
  final CategoryRepo categoryRepo;

  CategoryUsecase({required this.categoryRepo});

  Future<Either<Failure, List<CategoryEntity>>> getCategories() {
    return categoryRepo.getCategories();
  }
}
