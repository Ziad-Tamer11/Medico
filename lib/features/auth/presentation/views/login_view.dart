import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/login_view_body.dart';

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

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showMessageBar(context, 'Login Successful', Colors.green);
        }
        if (state is LoginFailure) {
          showMessageBar(context, 'Login Failed', AppColor.red);
        }
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}
