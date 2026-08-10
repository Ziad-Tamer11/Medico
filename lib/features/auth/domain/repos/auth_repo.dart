import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  //create user method
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  //sign in method
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  //google method
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  //facebook method
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  //add user
  Future addUserData({required UserEntity userEntity});

  //read user
  Future getUserData({required String uId});

  //save user data
  Future saveUserData({required UserEntity userEntity});
}
