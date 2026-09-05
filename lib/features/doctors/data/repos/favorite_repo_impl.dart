import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/favorite_api_service.dart';
import 'package:medico/features/doctors/domain/repos/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteApiService favoriteApiService;

  FavoriteRepoImpl({required this.favoriteApiService});

  @override
  Future<Either<Failure, void>> addFavorite({required int doctorId}) async {
    try {
      await favoriteApiService.addFavorite(doctorId: doctorId);
      return right(null);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in FavoriteRepoImpl.addFavorite: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite({required int doctorId}) async {
    try {
      await favoriteApiService.removeFavorite(doctorId: doctorId);
      return right(null);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in FavoriteRepoImpl.removeFavorite: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<int>>> getFavoriteDoctorIds() async {
    try {
      final ids = await favoriteApiService.getFavoriteDoctorIds();
      return right(ids);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in FavoriteRepoImpl.getFavoriteDoctorIds: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }
}
