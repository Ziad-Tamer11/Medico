import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthUsecase {
  final AuthRepo authRepo;

  AuthUsecase({required this.authRepo});

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  }) {
    return authRepo.createUserWithEmailAndPassword(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
    );
  }

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Either<Failure, UserEntity>> signInWithGoogle() {
    return authRepo.signInWithGoogle();
  }

  Future<Either<Failure, void>> logout() {
    return authRepo.logout();
  }

  UserEntity? getCachedUser() {
    return authRepo.getCachedUser();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }
}
