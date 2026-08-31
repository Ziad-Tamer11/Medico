part of 'doctor_details_cubit.dart';

@immutable
sealed class DoctorDetailsState {}

final class DoctorDetailsInitial extends DoctorDetailsState {}

final class DoctorDetailsLoading extends DoctorDetailsState {}

final class DoctorDetailsSuccess extends DoctorDetailsState {
  final DoctorEntity doctor;

  DoctorDetailsSuccess({required this.doctor});
}

final class DoctorDetailsFailure extends DoctorDetailsState {
  final String errMessage;

  DoctorDetailsFailure({required this.errMessage});
}
