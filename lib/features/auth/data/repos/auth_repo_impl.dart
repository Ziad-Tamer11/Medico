import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/database_service.dart';
import 'package:medico/core/services/firebase_auth_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/auth/data/models/user_model.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  // create user impl
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(userEntity: userEntity);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      await deleteUser(user);

      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }

  //delete user
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  //should delete user
  Future<void> deleteUserIfNeeded(bool shouldDeleteUser, User? user) async {
    if (shouldDeleteUser) {
      await deleteUser(user);
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
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
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
    User? user;
    bool shouldDeleteUser = false;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      UserEntity userEntity;
      userEntity = UserModel.fromFirebase(user);
      bool isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoints.checkIfUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        userEntity = await getUserData(uId: user.uid);
      } else {
        shouldDeleteUser = true;
        await addUserData(userEntity: userEntity);
      }
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUserIfNeeded(shouldDeleteUser, user);
      return left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      await deleteUserIfNeeded(shouldDeleteUser, user);
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }

  // facebook impl
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    bool shouldDeleteUser = false;
    try {
      var userCredential = await firebaseAuthService.signInWithFacebook();
      user = userCredential.user;
      UserEntity userEntity;
      if (user == null) {
        return left(
          ServerFailure(
            errMeesage: 'Facebook sign-in failed. Please try again.',
          ),
        );
      }
      userEntity = UserModel.fromFirebase(user);
      final isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoints.checkIfUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        userEntity = await getUserData(uId: user.uid);
      } else {
        shouldDeleteUser = true;
        await addUserData(userEntity: userEntity);
      }
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUserIfNeeded(shouldDeleteUser, user);
      return left(ServerFailure(errMeesage: e.errMessage));
    } catch (e) {
      await deleteUserIfNeeded(shouldDeleteUser, user);
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(
        ServerFailure(errMeesage: 'Something went wrong. Please try again.'),
      );
    }
  }

  //add user impl
  @override
  Future<void> addUserData({required UserEntity userEntity}) async {
    var userModel = UserModel.fromEntity(userEntity);
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: userModel.toMap(),
      documentId: userEntity.uId,
    );
  }

  //get user impl
  @override
  Future<UserEntity> getUserData({required String uId}) async {
    final userData = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      documentId: uId,
    );
    var userEntity = UserModel.fromJson(userData);
    return userEntity;
  }

  //save user data
  @override
  Future<dynamic> saveUserData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
