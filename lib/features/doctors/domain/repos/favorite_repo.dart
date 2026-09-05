import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, void>> addFavorite({required int doctorId});

  Future<Either<Failure, void>> removeFavorite({required int doctorId});

  Future<Either<Failure, List<int>>> getFavoriteDoctorIds();
}
