import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:meta/meta.dart';

part 'get_upcoming_appointment_state.dart';

class GetUpcomingAppointmentCubit extends Cubit<GetUpcomingAppointmentState> {
  GetUpcomingAppointmentCubit({required this.appointmentUseCase})
    : super(GetUpcomingAppointmentInitial());

  final AppointmentUseCase appointmentUseCase;

  Future<void> getUpcomingAppointments({required String patientId}) async {
    emit(GetUpcomingAppointmentsLoading());

    final result = await appointmentUseCase.getUpcomingAppointments(
      patientId: patientId,
    );
    result.fold(
      (failure) =>
          emit(GetUpcomingAppointmentsFailure(errMessage: failure.errMessage)),
      (appointments) =>
          emit(GetUpcomingAppointmentsSuccess(appointments: appointments)),
    );
  }
}
