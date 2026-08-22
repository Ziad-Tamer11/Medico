part of 'verify_otp_cubit.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpSuccess extends VerifyOtpState {
  final String resetToken;

  VerifyOtpSuccess({required this.resetToken});
}

final class VerifyOtpFailure extends VerifyOtpState {
  final String errMessage;

  VerifyOtpFailure({required this.errMessage});
}

final class ResendOtpLoading extends VerifyOtpState {}

final class ResendOtpSuccess extends VerifyOtpState {}

final class ResendOtpFailure extends VerifyOtpState {
  final String errMessage;

  ResendOtpFailure({required this.errMessage});
}
