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
    required String fullName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  }) async {
    emit(SignUpLoading());
    var result = await authUsecase.createUserWithEmailAndPassword(
      fullName: fullName,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
    );
    await result.fold(
      (failure) async => emit(SignUpFailure(errMessage: failure.errMessage)),
      (_) async {
        // signup نجح بس من غير tokens، فنعمل login تلقائي بنفس البيانات
        var loginResult = await authUsecase.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        loginResult.fold(
          (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
          (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
        );
      },
    );
  }
}
