part of 'create_appointment_cubit.dart';

@immutable
sealed class CreateAppointmentState {}

final class CreateAppointmentInitial extends CreateAppointmentState {}

final class CreateAppointmentLoading extends CreateAppointmentState {}

final class CreateAppointmentSuccess extends CreateAppointmentState {
  final AppointmentEntity appointment;

  CreateAppointmentSuccess({required this.appointment});
}

final class CreateAppointmentFailure extends CreateAppointmentState {
  final String errMessage;

  CreateAppointmentFailure({required this.errMessage});
}
