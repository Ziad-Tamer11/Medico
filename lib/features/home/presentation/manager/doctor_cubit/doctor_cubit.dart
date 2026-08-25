import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit({required this.doctorUsecase}) : super(DoctorInitial());
  final DoctorUsecase doctorUsecase;

  Future<void> getDoctor() async {
    // already loaded, or a request is already in flight — don't fire a
    // redundant duplicate request
    if (state is DoctorSuccess || state is DoctorLoading) return;
    emit(DoctorLoading());
    var result = await doctorUsecase.getDoctors();
    result.fold(
      (failure) => emit(DoctorFailure(errMessage: failure.errMessage)),
      (doctor) => emit(DoctorSuccess(doctorEntity: doctor)),
    );
  }

  Future<void> getDoctorsByCategory(int categoryId) async {
    emit(DoctorLoading());
    var result = await doctorUsecase.getDoctorsByCategory(
      categoryId: categoryId,
    );
    result.fold(
      (failure) => emit(DoctorFailure(errMessage: failure.errMessage)),
      (doctor) => emit(DoctorSuccess(doctorEntity: doctor)),
    );
  }

  Future<void> searchDoctors(String query) async {
    emit(DoctorLoading());
    var result = await doctorUsecase.searchDoctors(query: query);
    result.fold(
      (failure) => emit(DoctorFailure(errMessage: failure.errMessage)),
      (doctor) => emit(DoctorSuccess(doctorEntity: doctor)),
    );
  }

  // clears search results back to the initial "type to search" prompt,
  // e.g. when the user clears the search field
  void resetSearch() {
    emit(DoctorInitial());
  }
}
