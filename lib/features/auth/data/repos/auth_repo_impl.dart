import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/firebase_auth_service.dart';
import 'package:medico/features/auth/data/models/user_model.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  // create user impl
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel.fromFirebase(user);
      return right(userModel);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }

  // sign in impl
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userModel = UserModel.fromFirebase(user);
      return right(userModel);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }

  // google impl
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userModel = UserModel.fromFirebase(user);
      return right(userModel);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    var user = await firebaseAuthService.signInWithFacebook();
    var userModel = UserModel.fromFirebase(user.user!);
    return right(userModel);
  }
}
