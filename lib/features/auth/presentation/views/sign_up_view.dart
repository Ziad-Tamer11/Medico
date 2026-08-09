import 'package:flutter/material.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:medico/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/sign_up_view_bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignUpCubit(authUsecase: getIt<AuthUsecase>()),
          ),
          BlocProvider(
            create: (context) => LoginCubit(authUsecase: getIt<AuthUsecase>()),
          ),
        ],
        child: SignUpViewBlocConsumer(),
      ),
    );
  }
}
