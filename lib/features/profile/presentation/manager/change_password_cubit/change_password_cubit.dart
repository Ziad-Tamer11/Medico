import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.authUsecase})
    : super(ChangePasswordInitial());
  final AuthUsecase authUsecase;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await authUsecase.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ChangePasswordFailure(errMessage: failure.errMessage)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }
}
