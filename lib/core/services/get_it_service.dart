import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/services/database_service.dart';
import 'package:medico/core/services/fire_store_service.dart';
import 'package:medico/core/services/firebase_auth_service.dart';
import 'package:medico/core/services/stripe_service.dart';
import 'package:medico/features/auth/data/repos/auth_repo_impl.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/data/repos/appointment_repo_impl.dart';
import 'package:medico/features/home/data/repos/category_repo_impl.dart';
import 'package:medico/features/home/data/repos/doctor_repo_impl.dart';
import 'package:medico/features/home/domain/repos/appointment_repo.dart';
import 'package:medico/features/home/domain/repos/category_repo.dart';
import 'package:medico/features/home/domain/repos/doctor_repo.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:medico/features/home/domain/usecases/category_usecase.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:medico/features/payment/data/entities/usecase/payment_usecase.dart';
import 'package:medico/features/payment/data/repos/payment_repo_impl.dart';
import 'package:medico/features/payment/data/entities/repos/payment_repo.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<AuthUsecase>(
    AuthUsecase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerSingleton<CategoryRepo>(
    CategoryRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<CategoryUsecase>(
    CategoryUsecase(categoryRepo: getIt<CategoryRepo>()),
  );
  getIt.registerSingleton<DoctorRepo>(
    DoctorRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<DoctorUsecase>(
    DoctorUsecase(doctorRepo: getIt<DoctorRepo>()),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt<Dio>()));

  getIt.registerLazySingleton<StripeService>(
    () => StripeService(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImpl(stripeService: getIt<StripeService>()),
  );
  getIt.registerLazySingleton<PaymentUsecase>(
    () => PaymentUsecase(paymentRepo: getIt<PaymentRepo>()),
  );
  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerLazySingleton<AppointmentUseCase>(
    () => AppointmentUseCase(appointmentRepo: getIt<AppointmentRepo>()),
  );
}
