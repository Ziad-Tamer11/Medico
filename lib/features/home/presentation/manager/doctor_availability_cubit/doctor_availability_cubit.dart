import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:meta/meta.dart';

part 'doctor_availability_state.dart';

class DoctorAvailabilityCubit extends Cubit<DoctorAvailabilityState> {
  DoctorAvailabilityCubit({required this.doctorUsecase})
    : super(DoctorAvailabilityInitial());
  final DoctorUsecase doctorUsecase;

  Future<void> getDoctorAvailability(int doctorId) async {
    emit(DoctorAvailabilityLoading());
    final result = await doctorUsecase.getDoctorAvailability(
      doctorId: doctorId,
    );
    result.fold(
      (failure) => emit(DoctorAvailabilityFailure(errMessage: failure.errMessage)),
      (availability) =>
          emit(DoctorAvailabilitySuccess(availability: availability)),
    );
  }
}
