import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/forget_password_view_body_bloc_consumer.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: ''),
      body: BlocProvider(
        create: (context) =>
            ForgetPasswordCubit(authUsecase: getIt<AuthUsecase>()),
        child: const ForgetPasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
