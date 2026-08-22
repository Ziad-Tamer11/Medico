import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthUsecase {
  final AuthRepo authRepo;

  AuthUsecase({required this.authRepo});

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  }) {
    return authRepo.createUserWithEmailAndPassword(
      fullName: fullName,
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

  Future<Either<Failure, UserEntity>> updateProfile({
    required String fullName,
    required String phone,
  }) {
    return authRepo.updateProfile(fullName: fullName, phone: phone);
  }

  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return authRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<Either<Failure, void>> forgotPassword({required String email}) {
    return authRepo.forgotPassword(email: email);
  }

  Future<Either<Failure, String>> verifyOtp({
    required String email,
    required String otp,
  }) {
    return authRepo.verifyOtp(email: email, otp: otp);
  }

  Future<Either<Failure, void>> resetPassword({
    required String resetToken,
    required String newPassword,
  }) {
    return authRepo.resetPassword(
      resetToken: resetToken,
      newPassword: newPassword,
    );
  }
}
