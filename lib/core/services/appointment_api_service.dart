import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/doctors/data/models/appointment_model.dart';

class AppointmentApiService {
  final ApiService apiService;

  AppointmentApiService({required this.apiService});

  Future<AppointmentModel> createAppointment({
    required int doctorId,
    required DateTime appointmentDate,
    required String startTime,
    required String endTime,
    required String paymentIntentId,
  }) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      final response = await apiService.post(
        url: BackendEndpoints.createAppointment,
        token: token,
        body: {
          'doctor_id': doctorId,
          'appointment_date': _formatDate(appointmentDate),
          'start_time': startTime,
          'end_time': endTime,
          'payment_intent_id': paymentIntentId,
        },
      );
      return AppointmentModel.fromJson(response.data);
    } on DioException catch (e) {
      log('Exception in AppointmentApiService.createAppointment: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  Future<List<AppointmentModel>> getMyAppointments() async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      final response = await apiService.get(
        url: BackendEndpoints.myAppointments,
        token: token,
      );
      return (response.data as List)
          .map((json) => AppointmentModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      log('Exception in AppointmentApiService.getMyAppointments: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  Future<void> cancelAppointment({required int appointmentId}) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    try {
      await apiService.delete(
        url: BackendEndpoints.cancelAppointment(appointmentId),
        token: token,
      );
    } on DioException catch (e) {
      log('Exception in AppointmentApiService.cancelAppointment: ${e.toString()}');
      throw CustomExceptions(errMessage: _extractMessage(e));
    }
  }

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
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
