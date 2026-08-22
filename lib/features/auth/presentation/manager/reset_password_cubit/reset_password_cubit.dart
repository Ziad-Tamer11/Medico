import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.authUsecase})
    : super(ResetPasswordInitial());
  final AuthUsecase authUsecase;

  Future<void> resetPassword({
    required String resetToken,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    final result = await authUsecase.resetPassword(
      resetToken: resetToken,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ResetPasswordFailure(errMessage: failure.errMessage)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }
}
