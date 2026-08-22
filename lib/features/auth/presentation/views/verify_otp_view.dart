import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/verify_otp_view_body_bloc_consumer.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: ''),
      body: BlocProvider(
        create: (context) => VerifyOtpCubit(authUsecase: getIt<AuthUsecase>()),
        child: VerifyOtpViewBodyBlocConsumer(email: email),
      ),
    );
  }
}
