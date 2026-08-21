import 'package:dio/dio.dart';
import 'package:medico/core/services/token_provider.dart';

Dio buildDio({
  required String baseUrl,
  required String refreshEndpoint,
  required TokenCallbacks tokenCallbacks,
}) {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  // لو أكتر من request عمل 401 في نفس اللحظة، لازم كلهم يشتركوا في نفس
  // الـ refresh call بدل ما كل واحد يعمل refresh لوحده. لو الـ refresh
  // token بيشتغل مرة واحدة بس (rotation)، محاولتين متزامنتين هيفشل
  // التانية منهم وتمسح التوكنات، وده اللي كان بيسبب الـ 401 المتقطع.
  Future<String>? refreshFuture;

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (DioException error, handler) async {
        final isRefreshCall = error.requestOptions.path.contains(
          refreshEndpoint,
        );
        final alreadyRetried =
            error.requestOptions.extra['retried'] == true; // ← جديد

        if (error.response?.statusCode == 401 &&
            !isRefreshCall &&
            !alreadyRetried) {
          final refreshToken = tokenCallbacks.getRefreshToken();

          if (refreshToken != null && refreshToken.isNotEmpty) {
            String? newAccessToken;

            // مسح التوكنات لازم يحصل بس لو الـ /auth/refresh نفسه فشل
            // (يعني الـ refresh token غير صالح). لو مسحناها لأي فشل تاني
            // (زي إن الطلب المُعاد رجع 401 لسبب بيزنس زي "old password
            // incorrect")، هنبقى بنمسح توكنات سليمة تمامًا وكل طلب بعد
            // كده هيفشل بـ "Not Authenticated" لحد ما المستخدم يعمل login
            // تاني.
            try {
              // لو فيه refresh شغال بالفعل، استنى نتيجته بدل ما تعمل واحد جديد
              refreshFuture ??= () async {
                final refreshDio = Dio(BaseOptions(baseUrl: baseUrl));
                final response = await refreshDio.post(
                  refreshEndpoint,
                  data: {'refresh_token': refreshToken},
                );
                final token = response.data['access_token'] as String;
                await tokenCallbacks.saveAccessToken(token);
                return token;
              }();

              newAccessToken = await refreshFuture!;
            } catch (_) {
              await tokenCallbacks.clearTokens();
            } finally {
              refreshFuture = null;
            }

            if (newAccessToken != null) {
              error.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              error.requestOptions.extra['retried'] =
                  true; // ← جديد: علّم إن ده retry
              try {
                final retryResponse = await dio.fetch(error.requestOptions);
                return handler.resolve(retryResponse);
              } on DioException catch (retryError) {
                // فشل الطلب المُعاد لسبب حقيقي (مش مشكلة توكن، التوكن
                // الجديد صالح). سيبه يعدي كـ error عادي من غير ما نمسح
                // التوكنات.
                return handler.next(retryError);
              }
            }
          }
        }
        return handler.next(
          error,
        ); // لو already retried، سيب الـ 401 يعدي عادي كـ error حقيقي
      },
    ),
  );

  return dio;
}
