import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:meta/meta.dart';

part 'create_appointment_state.dart';

class AppointmentCubit extends Cubit<CreateAppointmentState> {
  AppointmentCubit({required this.appointmentUseCase})
    : super(CreateAppointmentInitial());

  final AppointmentUseCase appointmentUseCase;

  Future<void> createAppointment({
    required AppointmentEntity appointment,
  }) async {
    emit(CreateAppointmentLoading());
    final result = await appointmentUseCase.createAppointment(
      appointment: appointment,
    );
    result.fold((failure) {
      emit(CreateAppointmentFailure(errMessage: failure.errMessage));
    }, (appointment) => emit(CreateAppointmentSuccess()));
  }

  Future<void> getUpcomingAppointments({required String patientId}) async {
    emit(CreateAppointmentLoading());

    final result = await appointmentUseCase.getUpcomingAppointments(
      patientId: patientId,
    );

    result.fold(
      (failure) {
        emit(CreateAppointmentFailure(errMessage: failure.errMessage));
      },
      (appointments) {
        emit(CreateAppointmentSuccess());
      },
    );
  }
}
