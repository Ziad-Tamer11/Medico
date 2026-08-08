import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthUsecase {
  final AuthRepo authRepo;

  AuthUsecase({required this.authRepo});

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
