import 'package:bloc/bloc.dart';
import 'package:medico/features/doctors/domain/entities/category_entity.dart';
import 'package:medico/features/doctors/domain/usecases/category_usecase.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryUsecase}) : super(CategoryInitial());

  final CategoryUsecase categoryUsecase;

  Future<void> getCategories() async {
    // already loaded, or a request is already in flight — don't fire a
    // redundant duplicate request
    if (state is CategorySuccess || state is CategoryLoading) return;
    emit(CategoryLoading());
    var result = await categoryUsecase.getCategories();
    result.fold(
      (failure) => emit(CategoryFailure(errMessage: failure.errMessage)),
      (categories) => emit(CategorySuccess(categories: categories)),
    );
  }
}
