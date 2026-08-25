import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/home/data/models/doctor_availability_model.dart';
import 'package:medico/features/home/data/models/doctor_model.dart';

class DoctorApiService {
  final ApiService apiService;

  DoctorApiService({required this.apiService});

  Future<List<DoctorModel>> getDoctors() async {
    try {
      final response = await apiService.get(url: BackendEndpoints.doctors);
      return (response.data as List)
          .map((json) => DoctorModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      log('Exception in DoctorApiService.getDoctors: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  Future<List<DoctorModel>> getDoctorsByCategory({
    required int categoryId,
  }) async {
    try {
      final response = await apiService.get(
        url: BackendEndpoints.doctorsByCategory(categoryId),
      );
      return (response.data as List)
          .map((json) => DoctorModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      log('Exception in DoctorApiService.getDoctorsByCategory: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  Future<List<DoctorAvailabilityModel>> getDoctorAvailability({
    required int doctorId,
  }) async {
    try {
      final response = await apiService.get(
        url: BackendEndpoints.doctorAvailability(doctorId),
      );
      return (response.data as List)
          .map((json) => DoctorAvailabilityModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      log('Exception in DoctorApiService.getDoctorAvailability: ${e.toString()}');
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
