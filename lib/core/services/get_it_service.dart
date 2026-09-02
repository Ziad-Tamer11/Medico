import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/manager/app_user_cubit/app_user_cubit.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/services/appointment_api_service.dart';
import 'package:medico/core/services/auth_api_service.dart';
import 'package:medico/core/services/category_api_service.dart';
import 'package:medico/core/services/dio_client.dart';
import 'package:medico/core/services/doctor_api_service.dart';
import 'package:medico/core/services/favorite_api_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/services/stripe_service.dart';
import 'package:medico/core/services/token_provider.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/features/auth/data/repos/auth_repo_impl.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/data/repos/appointment_repo_impl.dart';
import 'package:medico/features/home/data/repos/category_repo_impl.dart';
import 'package:medico/features/home/data/repos/doctor_repo_impl.dart';
import 'package:medico/features/home/data/repos/favorite_repo_impl.dart';
import 'package:medico/features/home/domain/repos/appointment_repo.dart';
import 'package:medico/features/home/domain/repos/category_repo.dart';
import 'package:medico/features/home/domain/repos/doctor_repo.dart';
import 'package:medico/features/home/domain/repos/favorite_repo.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:medico/features/home/domain/usecases/category_usecase.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:medico/features/home/domain/usecases/favorite_usecase.dart';
import 'package:medico/features/home/presentation/manager/cancel_appointment_cubit/cancel_appointment_cubit.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/features/home/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';
import 'package:medico/features/payment/data/entities/usecase/payment_usecase.dart';
import 'package:medico/features/payment/data/repos/payment_repo_impl.dart';
import 'package:medico/features/payment/data/entities/repos/payment_repo.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<Dio>(() {
    return buildDio(
      baseUrl: kBaseUrl,
      refreshEndpoint: BackendEndpoints.refresh,
      tokenCallbacks: TokenCallbacks(
        getAccessToken: () => Prefs.getString(kAccessToken),
        getRefreshToken: () => Prefs.getString(kRefreshToken),
        saveAccessToken: (token) => Prefs.setString(kAccessToken, token),
        clearTokens: () async {
          await Prefs.setString(kAccessToken, '');
          await Prefs.setString(kRefreshToken, '');
        },
      ),
    );
  });
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt<Dio>()));

  getIt.registerSingleton<AuthApiService>(
    AuthApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authApiService: getIt<AuthApiService>()),
  );
  getIt.registerSingleton<AuthUsecase>(
    AuthUsecase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerSingleton<AppUserCubit>(AppUserCubit());
  getIt.registerSingleton<CategoryApiService>(
    CategoryApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<CategoryRepo>(
    CategoryRepoImpl(categoryApiService: getIt<CategoryApiService>()),
  );
  getIt.registerSingleton<CategoryUsecase>(
    CategoryUsecase(categoryRepo: getIt<CategoryRepo>()),
  );
  getIt.registerSingleton<CategoryCubit>(
    CategoryCubit(categoryUsecase: getIt<CategoryUsecase>()),
  );
  getIt.registerSingleton<DoctorApiService>(
    DoctorApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<DoctorRepo>(
    DoctorRepoImpl(doctorApiService: getIt<DoctorApiService>()),
  );
  getIt.registerSingleton<DoctorUsecase>(
    DoctorUsecase(doctorRepo: getIt<DoctorRepo>()),
  );
  getIt.registerSingleton<DoctorCubit>(
    DoctorCubit(doctorUsecase: getIt<DoctorUsecase>()),
  );
  getIt.registerSingleton<FavoriteApiService>(
    FavoriteApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<FavoriteRepo>(
    FavoriteRepoImpl(favoriteApiService: getIt<FavoriteApiService>()),
  );
  getIt.registerSingleton<FavoriteUsecase>(
    FavoriteUsecase(favoriteRepo: getIt<FavoriteRepo>()),
  );
  getIt.registerSingleton<FavoriteCubit>(
    FavoriteCubit(favoriteUsecase: getIt<FavoriteUsecase>()),
  );

  getIt.registerLazySingleton<StripeService>(
    () => StripeService(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImpl(stripeService: getIt<StripeService>()),
  );
  getIt.registerLazySingleton<PaymentUsecase>(
    () => PaymentUsecase(paymentRepo: getIt<PaymentRepo>()),
  );
  getIt.registerLazySingleton<AppointmentApiService>(
    () => AppointmentApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(
      appointmentApiService: getIt<AppointmentApiService>(),
    ),
  );
  getIt.registerLazySingleton<AppointmentUseCase>(
    () => AppointmentUseCase(appointmentRepo: getIt<AppointmentRepo>()),
  );
  getIt.registerSingleton<GetUpcomingAppointmentCubit>(
    GetUpcomingAppointmentCubit(
      appointmentUseCase: getIt<AppointmentUseCase>(),
      authUsecase: getIt<AuthUsecase>(),
    ),
  );
  getIt.registerSingleton<CancelAppointmentCubit>(
    CancelAppointmentCubit(appointmentUseCase: getIt<AppointmentUseCase>()),
  );
}
