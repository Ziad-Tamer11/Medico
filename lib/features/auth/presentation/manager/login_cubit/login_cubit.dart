import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authUsecase}) : super(LoginInitial());
  final AuthUsecase authUsecase;
  //sign in cubit
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await authUsecase.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMeesage)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
  //google cubit

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await authUsecase.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMeesage)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
