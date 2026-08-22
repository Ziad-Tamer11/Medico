import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/auth/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/verify_otp_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerifyOtpViewBodyBlocConsumer extends StatelessWidget {
  const VerifyOtpViewBodyBlocConsumer({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          context.push(AppRoute.kResetPasswordView, extra: state.resetToken);
        }
        if (state is VerifyOtpFailure) {
          showMessageBar(context, state.errMessage, AppColor.red);
        }
        if (state is ResendOtpSuccess) {
          showMessageBar(
            context,
            'A new code has been sent to your email',
            Colors.green,
          );
        }
        if (state is ResendOtpFailure) {
          showMessageBar(context, state.errMessage, AppColor.red);
        }
      },
      builder: (context, state) {
        final isLoading = state is VerifyOtpLoading || state is ResendOtpLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: VerifyOtpViewBody(email: email),
        );
      },
    );
  }
}
