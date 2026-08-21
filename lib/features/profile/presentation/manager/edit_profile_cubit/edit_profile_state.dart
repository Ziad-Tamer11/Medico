part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final UserEntity userEntity;
  EditProfileSuccess({required this.userEntity});
}

final class EditProfileFailure extends EditProfileState {
  final String errMessage;
  EditProfileFailure({required this.errMessage});
}
