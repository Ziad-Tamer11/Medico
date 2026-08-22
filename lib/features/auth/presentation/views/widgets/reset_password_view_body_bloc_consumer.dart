import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/reset_password_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ResetPasswordViewBodyBlocConsumer({super.key, required this.resetToken});
  final String resetToken;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showMessageBar(
            context,
            'Password reset successfully. You can now log in.',
            Colors.green,
          );
          // clears the whole ForgetPassword -> VerifyOtp -> ResetPassword
          // stack instead of leaving them poppable via the new Login screen
          context.go(AppRoute.kLoginView);
        }
        if (state is ResetPasswordFailure) {
          showMessageBar(context, state.errMessage, AppColor.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
          child: ResetPasswordViewBody(resetToken: resetToken),
        );
      },
    );
  }
}
