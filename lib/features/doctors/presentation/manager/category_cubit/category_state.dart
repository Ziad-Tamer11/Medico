part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;
  CategorySuccess({required this.categories});
}

final class CategoryFailure extends CategoryState {
  final String errMessage;

  CategoryFailure({required this.errMessage});
}
