import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/backend_endpoints.dart';

class FavoriteApiService {
  final ApiService apiService;

  FavoriteApiService({required this.apiService});

  Future<void> addFavorite({required int doctorId}) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      await apiService.post(
        url: BackendEndpoints.favorites,
        token: token,
        body: {'doctor_id': doctorId},
      );
    } on DioException catch (e) {
      log('Exception in FavoriteApiService.addFavorite: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  Future<void> removeFavorite({required int doctorId}) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      await apiService.delete(
        url: BackendEndpoints.favorite(doctorId),
        token: token,
      );
    } on DioException catch (e) {
      log('Exception in FavoriteApiService.removeFavorite: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  Future<List<int>> getFavoriteDoctorIds() async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      final response = await apiService.get(
        url: BackendEndpoints.favorites,
        token: token,
      );
      return (response.data as List)
          .map((json) => json['doctor_id'] as int)
          .toList();
    } on DioException catch (e) {
      log('Exception in FavoriteApiService.getFavoriteDoctorIds: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
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
}
