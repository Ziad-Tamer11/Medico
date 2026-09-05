import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:medico/features/doctors/domain/usecases/favorite_usecase.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

// App-wide singleton (like AppUserCubit) so every screen that shows a doctor
// (cards, details, my-favorites) reflects the same favorite state instantly.
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.favoriteUsecase}) : super(FavoriteInitial());
  final FavoriteUsecase favoriteUsecase;

  bool isFavorite(int doctorId) {
    final state = this.state;
    return state is FavoriteLoaded && state.doctorIds.contains(doctorId);
  }

  Future<void> loadFavorites() async {
    // already loaded, or a request is already in flight — don't fire a
    // redundant duplicate request
    if (state is FavoriteLoaded || state is FavoriteLoading) return;
    emit(FavoriteLoading());
    final result = await favoriteUsecase.getFavoriteDoctorIds();
    result.fold(
      (failure) => emit(FavoriteFailure(errMessage: failure.errMessage)),
      (ids) => emit(FavoriteLoaded(doctorIds: ids.toSet())),
    );
  }

  Future<void> toggleFavorite(int doctorId) async {
    final currentIds = state is FavoriteLoaded
        ? (state as FavoriteLoaded).doctorIds
        : <int>{};
    final isCurrentlyFavorite = currentIds.contains(doctorId);

    final result = isCurrentlyFavorite
        ? await favoriteUsecase.removeFavorite(doctorId: doctorId)
        : await favoriteUsecase.addFavorite(doctorId: doctorId);

    result.fold(
      // a failed toggle shouldn't blank out every favorite icon on screen —
      // just leave the state as it was and log it.
      (failure) => log('FavoriteCubit.toggleFavorite failed: ${failure.errMessage}'),
      (_) {
        final updatedIds = Set<int>.from(currentIds);
        if (isCurrentlyFavorite) {
          updatedIds.remove(doctorId);
        } else {
          updatedIds.add(doctorId);
        }
        emit(FavoriteLoaded(doctorIds: updatedIds));
      },
    );
  }

  Future<void> clearAllFavorites() async {
    if (state is! FavoriteLoaded) return;
    final ids = (state as FavoriteLoaded).doctorIds.toList();
    for (final id in ids) {
      await favoriteUsecase.removeFavorite(doctorId: id);
    }
    emit(FavoriteLoaded(doctorIds: {}));
  }

  // called on logout so the next login doesn't briefly show a previous
  // user's favorites before loadFavorites() runs again
  void clear() {
    emit(FavoriteInitial());
  }
}
