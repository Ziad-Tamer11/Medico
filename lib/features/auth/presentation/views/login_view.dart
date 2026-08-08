import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(authUsecase: getIt<AuthUsecase>()),
        child: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
