part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final Set<int> doctorIds;

  FavoriteLoaded({required this.doctorIds});
}

final class FavoriteFailure extends FavoriteState {
  final String errMessage;

  FavoriteFailure({required this.errMessage});
}
