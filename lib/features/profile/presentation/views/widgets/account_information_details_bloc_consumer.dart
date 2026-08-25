import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/features/profile/presentation/views/widgets/account_information_details_bloc_builder.dart';

class AccountInformationDetailsBlocConsumer extends StatelessWidget {
  const AccountInformationDetailsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          getIt<FavoriteCubit>().clear();
          context.pushReplacement(AppRoute.kLoginView);
        }
        if (state is SignOutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: AccountInformationDetailsBlocBuilder(),
    );
  }
}
