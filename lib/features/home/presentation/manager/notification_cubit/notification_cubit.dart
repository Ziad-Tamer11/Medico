import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

// Unlike GetUpcomingAppointmentCubit, this keeps every appointment (past and
// future) as a booking-confirmation feed, newest first - there's no separate
// notifications table on the backend, so /appointments/me doubles as that feed.
class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({required this.appointmentUseCase})
    : super(NotificationInitial());

  final AppointmentUseCase appointmentUseCase;

  Future<void> getNotifications() async {
    emit(NotificationLoading());
    final result = await appointmentUseCase.getMyAppointments();
    result.fold(
      (failure) => emit(NotificationFailure(errMessage: failure.errMessage)),
      (appointments) {
        final sorted = appointments.toList()
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
        emit(NotificationSuccess(appointments: sorted));
      },
    );
  }
}
