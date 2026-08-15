import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/usecases/category_usecase.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryUsecase}) : super(CategoryInitial());

  final CategoryUsecase categoryUsecase;

  Future<void> getCategories() async {
    emit(CategoryLoading());
    var result = await categoryUsecase.getCategories();
    result.fold(
      (failure) => emit(CategoryFailure(errMessage: failure.errMeesage)),
      (categories) => emit(CategorySuccess(categories: categories)),
    );
  }
}
