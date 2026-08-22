import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({required this.authUsecase}) : super(VerifyOtpInitial());
  final AuthUsecase authUsecase;

  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(VerifyOtpLoading());
    final result = await authUsecase.verifyOtp(email: email, otp: otp);
    result.fold(
      (failure) => emit(VerifyOtpFailure(errMessage: failure.errMessage)),
      (resetToken) => emit(VerifyOtpSuccess(resetToken: resetToken)),
    );
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoading());
    final result = await authUsecase.forgotPassword(email: email);
    result.fold(
      (failure) => emit(ResendOtpFailure(errMessage: failure.errMessage)),
      (_) => emit(ResendOtpSuccess()),
    );
  }
}
