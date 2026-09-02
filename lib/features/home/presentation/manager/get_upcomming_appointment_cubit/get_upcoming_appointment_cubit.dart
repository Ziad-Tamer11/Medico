import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:meta/meta.dart';

part 'get_upcoming_appointment_state.dart';

class GetUpcomingAppointmentCubit extends Cubit<GetUpcomingAppointmentState> {
  GetUpcomingAppointmentCubit({
    required this.appointmentUseCase,
    required this.authUsecase,
  }) : super(GetUpcomingAppointmentInitial());

  final AppointmentUseCase appointmentUseCase;
  final AuthUsecase authUsecase;

  // the backend returns every appointment for the caller (past and future);
  // "upcoming" is a display concern, so the filter/sort happens here
  Future<void> getUpcomingAppointments({bool forceRefresh = false}) async {
    // /appointments/me needs a valid access token; skip the fetch otherwise
    // instead of letting it fail with a 401
    if (!authUsecase.isLoggedIn()) return;
    // already loaded, or a request is already in flight — don't fire a
    // redundant duplicate request, unless the caller explicitly needs
    // fresh data (e.g. right after booking a new appointment)
    if (!forceRefresh &&
        (state is GetUpcomingAppointmentsSuccess ||
            state is GetUpcomingAppointmentsLoading)) {
      return;
    }

    emit(GetUpcomingAppointmentsLoading());

    final result = await appointmentUseCase.getMyAppointments();
    result.fold(
      (failure) =>
          emit(GetUpcomingAppointmentsFailure(errMessage: failure.errMessage)),
      (appointments) {
        final now = DateTime.now();
        final upcoming =
            appointments.where((appointment) {
              return appointment.date.isAfter(now) ||
                  _isSameDay(appointment.date, now);
            }).toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));
        emit(GetUpcomingAppointmentsSuccess(appointments: upcoming));
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
