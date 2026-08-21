import 'package:bloc/bloc.dart';
import 'package:medico/core/manager/app_user_cubit/app_user_cubit.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.authUsecase}) : super(EditProfileInitial());
  final AuthUsecase authUsecase;

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    emit(EditProfileLoading());
    final result = await authUsecase.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
    result.fold(
      (failure) => emit(EditProfileFailure(errMessage: failure.errMessage)),
      (userEntity) {
        getIt<AppUserCubit>().refresh();
        emit(EditProfileSuccess(userEntity: userEntity));
      },
    );
  }
}
