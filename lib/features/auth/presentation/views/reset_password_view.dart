import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/reset_password_view_body_bloc_consumer.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.resetToken});
  final String resetToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: ''),
      body: BlocProvider(
        create: (context) =>
            ResetPasswordCubit(authUsecase: getIt<AuthUsecase>()),
        child: ResetPasswordViewBodyBlocConsumer(resetToken: resetToken),
      ),
    );
  }
}
