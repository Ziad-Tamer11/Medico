import 'package:bloc/bloc.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
}
