import 'package:bloc/bloc.dart';
import 'package:medico/features/doctors/domain/usecases/appointment_usecase.dart';
import 'package:meta/meta.dart';

part 'cancel_appointment_state.dart';

class CancelAppointmentCubit extends Cubit<CancelAppointmentState> {
  CancelAppointmentCubit({required this.appointmentUseCase})
    : super(CancelAppointmentInitial());
  final AppointmentUseCase appointmentUseCase;

  Future<void> cancelAppointment(
    int appointmentId, {
    required String doctorName,
  }) async {
    emit(CancelAppointmentLoading());
    final result = await appointmentUseCase.cancelAppointment(
      appointmentId: appointmentId,
    );
    result.fold(
      (failure) => emit(CancelAppointmentFailure(errMessage: failure.errMessage)),
      (_) => emit(CancelAppointmentSuccess(doctorName: doctorName)),
    );
  }
}
