import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/auth/domain/usecases/auth_usecase.dart';
import 'package:medico/features/auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:medico/features/profile/presentation/views/widgets/account_information_details.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Information', style: TextStyles.font16Bold),
          SizedBox(height: 24),
          BlocProvider(
            create: (context) =>
                SignOutCubit(authUsecase: getIt<AuthUsecase>()),
            child: AccountInformationDetailsBlocConsumer(),
          ),
        ],
      ),
    );
  }
}

class AccountInformationDetailsBlocConsumer extends StatelessWidget {
  const AccountInformationDetailsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          context.pushReplacement(AppRoute.kLoginView);
        }
        if (state is SignOutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: AccountInformationDetails(),
    );
  }
}
