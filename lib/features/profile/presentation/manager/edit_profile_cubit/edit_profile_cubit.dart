import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.authUsecase}) : super(EditProfileInitial());
  final AuthUsecase authUsecase;

  Future<void> updateProfile({
    required String fullName,
    required String phone,
  }) async {
    emit(EditProfileLoading());
    final result = await authUsecase.updateProfile(
      fullName: fullName,
      phone: phone,
    );
    result.fold(
      (failure) => emit(EditProfileFailure(errMessage: failure.errMessage)),
      (userEntity) => emit(EditProfileSuccess(userEntity: userEntity)),
    );
  }
}
