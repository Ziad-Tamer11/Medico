import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgetPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          showMessageBar(
            context,
            'Verification code sent to your email',
            Colors.green,
          );
          context.push(AppRoute.kVerifyOtpView, extra: state.email);
        }
        if (state is ForgetPasswordFailure) {
          showMessageBar(context, state.errMessage, AppColor.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPasswordLoading,
          child: const ForgetPasswordViewBody(),
        );
      },
    );
  }
}
