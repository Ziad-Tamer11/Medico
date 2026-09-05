import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/doctors/domain/repos/favorite_repo.dart';

class FavoriteUsecase {
  final FavoriteRepo favoriteRepo;

  FavoriteUsecase({required this.favoriteRepo});

  Future<Either<Failure, void>> addFavorite({required int doctorId}) {
    return favoriteRepo.addFavorite(doctorId: doctorId);
  }

  Future<Either<Failure, void>> removeFavorite({required int doctorId}) {
    return favoriteRepo.removeFavorite(doctorId: doctorId);
  }

  Future<Either<Failure, List<int>>> getFavoriteDoctorIds() {
    return favoriteRepo.getFavoriteDoctorIds();
  }
}
