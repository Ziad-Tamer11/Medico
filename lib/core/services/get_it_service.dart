import 'package:get_it/get_it.dart';
import 'package:medico/core/services/firebase_auth_service.dart';
import 'package:medico/features/auth/data/repos/auth_repo_impl.dart';
import 'package:medico/features/auth/domain/repos/auth_repo.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerSingleton<AuthUsecase>(
    AuthUsecase(authRepo: getIt<AuthRepo>()),
  );
}
