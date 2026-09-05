part of 'get_upcoming_appointment_cubit.dart';

@immutable
sealed class GetUpcomingAppointmentState {}

final class GetUpcomingAppointmentInitial extends GetUpcomingAppointmentState {}

final class GetUpcomingAppointmentsLoading
    extends GetUpcomingAppointmentState {}

final class GetUpcomingAppointmentsSuccess extends GetUpcomingAppointmentState {
  final List<AppointmentEntity> appointments;

  GetUpcomingAppointmentsSuccess({required this.appointments});
}

final class GetUpcomingAppointmentsFailure extends GetUpcomingAppointmentState {
  final String errMessage;

  GetUpcomingAppointmentsFailure({required this.errMessage});
}
