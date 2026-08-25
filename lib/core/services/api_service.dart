import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> post({
    required String url,
    required body,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }

  Future<Response> get({
    required String url,
    String token = '',
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': "Bearer $token"}),
    );
    return response;
  }

  Future<Response> put({
    required String url,
    required body,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    var response = await dio.put(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }

  Future<Response> delete({required String url, required String token}) async {
    var response = await dio.delete(
      url,
      options: Options(headers: {'Authorization': "Bearer $token"}),
    );
    return response;
  }
}
