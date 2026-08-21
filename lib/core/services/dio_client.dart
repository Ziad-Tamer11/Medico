import 'package:dio/dio.dart';
import 'token_provider.dart';

Dio buildDio({
  required String baseUrl,
  required String refreshEndpoint,
  required TokenCallbacks tokenCallbacks,
}) {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (DioException error, handler) async {
        final isRefreshCall = error.requestOptions.path.contains(
          refreshEndpoint,
        );

        if (error.response?.statusCode == 401 && !isRefreshCall) {
          final refreshToken = tokenCallbacks.getRefreshToken();

          if (refreshToken != null && refreshToken.isNotEmpty) {
            try {
              final refreshDio = Dio(BaseOptions(baseUrl: baseUrl));
              final response = await refreshDio.post(
                refreshEndpoint,
                data: {'refresh_token': refreshToken},
              );

              final newAccessToken = response.data['access_token'] as String;
              await tokenCallbacks.saveAccessToken(newAccessToken);

              error.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              final retryResponse = await dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            } catch (_) {
              await tokenCallbacks.clearTokens();
            }
          }
        }
        return handler.next(error);
      },
    ),
  );

  return dio;
}
