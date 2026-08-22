import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.authUsecase})
    : super(ForgetPasswordInitial());
  final AuthUsecase authUsecase;

  Future<void> sendOtp({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await authUsecase.forgotPassword(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(errMessage: failure.errMessage)),
      (_) => emit(ForgetPasswordSuccess(email: email)),
    );
  }
}
