import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:meta/meta.dart';

part 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  CreateAppointmentCubit({required this.appointmentUseCase})
    : super(CreateAppointmentInitial());

  final AppointmentUseCase appointmentUseCase;

  Future<void> createAppointment({
    required int doctorId,
    required DateTime appointmentDate,
    required String startTime,
    required String endTime,
    required String paymentIntentId,
  }) async {
    emit(CreateAppointmentLoading());
    final result = await appointmentUseCase.createAppointment(
      doctorId: doctorId,
      appointmentDate: appointmentDate,
      startTime: startTime,
      endTime: endTime,
      paymentIntentId: paymentIntentId,
    );
    result.fold(
      (failure) =>
          emit(CreateAppointmentFailure(errMessage: failure.errMessage)),
      (appointment) => emit(CreateAppointmentSuccess(appointment: appointment)),
    );
  }
}
