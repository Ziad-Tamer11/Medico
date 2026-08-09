import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showMessageBar(context, 'Account created successfully', Colors.green);
          GoRouter.of(context).push(AppRoute.kHomeView);
        }
        if (state is SignUpFailure) {
          showMessageBar(context, 'Failed to create account', AppColor.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
