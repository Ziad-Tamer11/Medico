import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit({required this.doctorUsecase}) : super(DoctorInitial());
  final DoctorUsecase doctorUsecase;
  Future<void> getDoctor() async {
    emit(DoctorLoading());
    var result = await doctorUsecase.getCategories();
    result.fold(
      (failure) => emit(DoctorFailure(errMessage: failure.errMessage)),
      (doctor) => emit(DoctorSuccess(doctorEntity: doctor)),
    );
  }
}
