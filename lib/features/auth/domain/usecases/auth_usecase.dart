import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthUsecase {
  final AuthRepo authRepo;

  AuthUsecase({required this.authRepo});
  //create user useCase
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) {
    return authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }

  //sign in with email and password useCase
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //sign in with google useCase
  Future<Either<Failure, UserEntity>> signInWithGoogle() {
    return authRepo.signInWithGoogle();
  }
}
