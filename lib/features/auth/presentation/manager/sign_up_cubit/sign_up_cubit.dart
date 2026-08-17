import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authUsecase}) : super(SignUpInitial());
  final AuthUsecase authUsecase;

  //sign up cubit
  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    var result = await authUsecase.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
