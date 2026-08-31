import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:meta/meta.dart';

part 'doctor_details_state.dart';

// Fetches one doctor fresh by id. The backend now embeds that doctor's
// full working-hours and availability directly in this single response
// (no more separate /availability or /working-hours endpoints), so this
// one fetch replaces what used to be two separate cubits.
class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit({required this.doctorUsecase})
    : super(DoctorDetailsInitial());
  final DoctorUsecase doctorUsecase;

  Future<void> getDoctorById(int doctorId) async {
    emit(DoctorDetailsLoading());
    final result = await doctorUsecase.getDoctorById(doctorId: doctorId);
    result.fold(
      (failure) => emit(DoctorDetailsFailure(errMessage: failure.errMessage)),
      (doctor) => emit(DoctorDetailsSuccess(doctor: doctor)),
    );
  }
}
