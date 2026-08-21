import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_user.dart';
import 'package:medico/core/manager/app_user_cubit/app_user_cubit.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAppBarBlocBuilder extends StatelessWidget {
  const CustomAppBarBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, UserEntity?>(
      builder: (context, user) {
        final isLoading = user == null;
        return Skeletonizer(
          enabled: isLoading,
          child: CustomAppBarBody(user: user ?? dummyUser),
        );
      },
    );
  }
}
