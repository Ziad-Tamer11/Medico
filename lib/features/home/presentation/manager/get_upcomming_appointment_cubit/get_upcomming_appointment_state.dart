part of 'get_upcomming_appointment_cubit.dart';

@immutable
sealed class GetUpcommingAppointmentState {}

final class GetUpcommingAppointmentInitial
    extends GetUpcommingAppointmentState {}

final class GetUpcomingAppointmentsLoading
    extends GetUpcommingAppointmentState {}

final class GetUpcomingAppointmentsSuccess
    extends GetUpcommingAppointmentState {
  final List<AppointmentEntity> appointments;

  GetUpcomingAppointmentsSuccess({required this.appointments});
}

final class GetUpcomingAppointmentsFailure
    extends GetUpcommingAppointmentState {
  final String errMessage;

  GetUpcomingAppointmentsFailure({required this.errMessage});
}
