import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:medico/features/profile/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:medico/features/profile/presentation/views/widgets/edit_profile_view_body_bloc_consumer.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Account Information'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<EditProfileCubit>()),
          BlocProvider(create: (_) => getIt<ChangePasswordCubit>()),
        ],
        child: const EditProfileViewBodyBlocConsumer(),
      ),
    );
  }
}
