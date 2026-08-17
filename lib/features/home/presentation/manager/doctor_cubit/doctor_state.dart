part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorSuccess extends DoctorState {
  final List<DoctorEntity> doctorEntity;

  DoctorSuccess({required this.doctorEntity});
}

final class DoctorFailure extends DoctorState {
  final String errMessage;

  DoctorFailure({required this.errMessage});
}
