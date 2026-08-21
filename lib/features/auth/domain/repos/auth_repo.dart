import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, void>> logout();

  Future<void> saveUserData({required UserEntity userEntity});

  UserEntity? getCachedUser();

  bool isLoggedIn();

  Future<Either<Failure, UserEntity>> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  });

  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
