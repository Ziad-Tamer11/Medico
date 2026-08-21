import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/auth/data/models/user_model.dart';

class AuthApiService {
  final ApiService apiService;

  AuthApiService({required this.apiService});

  //create user
  Future<UserModel> createUserWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  }) async {
    try {
      final response = await apiService.post(
        url: BackendEndpoints.signup,
        token: '',
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'phone': phone,
          'gender': gender,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      log(
        'Exception in AuthApiService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  //sign in
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        url: BackendEndpoints.login,
        token: '',
        body: {'email': email, 'password': password},
      );
      await _saveTokens(response.data);
      return UserModel.fromJson(response.data['user']);
    } on DioException catch (e) {
      log(
        'Exception in AuthApiService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  //google sign in — بياخد idToken جاهز ويبعته للـ backend
  Future<UserModel> signInWithGoogle(String idToken) async {
    try {
      final response = await apiService.post(
        url: BackendEndpoints.googleLogin,
        token: '',
        body: {'token': idToken},
      );
      await _saveTokens(response.data);
      return UserModel.fromJson(response.data['user']);
    } on DioException catch (e) {
      log('Exception in AuthApiService.signInWithGoogle: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  //logout
  Future<void> logout() async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      await apiService.post(
        url: BackendEndpoints.logout,
        token: token,
        body: {},
      );
    } catch (_) {
      // نمسح التوكنات محليًا في كل الأحوال
    } finally {
      await Prefs.setString(kAccessToken, '');
      await Prefs.setString(kRefreshToken, '');
    }
  }

  Future<void> _saveTokens(Map<String, dynamic> data) async {
    await Prefs.setString(kAccessToken, data['access_token']);
    await Prefs.setString(kRefreshToken, data['refresh_token']);
  }

  String _extractMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['detail'] != null) return data['detail'].toString();
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      return 'Make sure you are connected to the internet.';
    }
    return 'Something went wrong. Please try again.';
  }

  //update profile (name + phone)
  Future<UserModel> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      final response = await apiService.put(
        url: BackendEndpoints.updateProfile,
        token: token,
        body: {'first_name': firstName, 'last_name': lastName, 'phone': phone},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      log('Exception in AuthApiService.updateProfile: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  //change password
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      await apiService.put(
        url: BackendEndpoints.changePassword,
        token: token,
        body: {'old_password': oldPassword, 'new_password': newPassword},
      );
    } on DioException catch (e) {
      log('Exception in AuthApiService.changePassword: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }
}
