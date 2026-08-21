import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit({required this.authUsecase}) : super(SignOutInitial());

  final AuthUsecase authUsecase;

  Future<void> logout() async {
    emit(SignOutLoading());
    final result = await authUsecase.logout();
    result.fold(
      (failure) => emit(SignOutFailure(errMessage: failure.errMessage)),
      (_) => emit(SignOutSuccess()),
    );
  }
}
