part of 'doctor_availability_cubit.dart';

@immutable
sealed class DoctorAvailabilityState {}

final class DoctorAvailabilityInitial extends DoctorAvailabilityState {}

final class DoctorAvailabilityLoading extends DoctorAvailabilityState {}

final class DoctorAvailabilitySuccess extends DoctorAvailabilityState {
  final List<DoctorAvailabilityEntity> availability;

  DoctorAvailabilitySuccess({required this.availability});
}

final class DoctorAvailabilityFailure extends DoctorAvailabilityState {
  final String errMessage;

  DoctorAvailabilityFailure({required this.errMessage});
}
