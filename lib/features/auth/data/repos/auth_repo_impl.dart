import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/auth_api_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/features/auth/data/models/user_model.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApiService authApiService;

  AuthRepoImpl({required this.authApiService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  }) async {
    try {
      final userModel = await authApiService.createUserWithEmailAndPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        gender: gender,
      );
      return right(userModel);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await authApiService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await saveUserData(userEntity: userModel);
      return right(userModel);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn.instance.authenticate();
      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        return left(
          ServerFailure(errMessage: 'Google sign in failed. Please try again.'),
        );
      }
      final userModel = await authApiService.signInWithGoogle(idToken);
      await saveUserData(userEntity: userModel);
      return right(userModel);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authApiService.logout();
      await Prefs.remove(kUserData);
      return right(null);
    } catch (e) {
      log('Exception in AuthRepoImpl.logout: ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'Something went wrong. Please try again.'),
      );
    }
  }

  @override
  Future<void> saveUserData({required UserEntity userEntity}) async {
    final jsonData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  @override
  UserEntity? getCachedUser() {
    final jsonData = Prefs.getString(kUserData);
    if (jsonData == null || jsonData.isEmpty) return null;
    return UserModel.fromJson(jsonDecode(jsonData));
  }

  @override
  bool isLoggedIn() {
    final token = Prefs.getString(kAccessToken);
    return token != null && token.isNotEmpty;
  }
}
