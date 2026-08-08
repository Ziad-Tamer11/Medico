import 'package:flutter/material.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(authUsecase: getIt<AuthUsecase>()),
        child: SignUpViewBody(),
      ),
    );
  }
}
