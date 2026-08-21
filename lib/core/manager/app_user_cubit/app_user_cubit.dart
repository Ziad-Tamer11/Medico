import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_user.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

class AppUserCubit extends Cubit<UserEntity?> {
  AppUserCubit() : super(null);

  void refresh() {
    emit(getUser());
  }
}
