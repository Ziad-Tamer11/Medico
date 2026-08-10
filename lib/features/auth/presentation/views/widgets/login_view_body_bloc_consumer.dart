import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showMessageBar(context, 'Login Successful', Colors.green);
          GoRouter.of(context).push(AppRoute.kHomeView);
        }
        if (state is LoginFailure) {
          showMessageBar(context, state.errMessage, AppColor.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
