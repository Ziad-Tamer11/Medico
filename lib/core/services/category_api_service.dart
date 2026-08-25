import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:medico/core/errors/exceptions.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/home/data/models/category_model.dart';

class CategoryApiService {
  final ApiService apiService;

  CategoryApiService({required this.apiService});

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await apiService.get(url: BackendEndpoints.categories);
      return (response.data as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      log('Exception in CategoryApiService.getCategories: ${e.toString()}');
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
