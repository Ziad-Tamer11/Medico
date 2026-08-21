import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';
import 'package:medico/features/auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:medico/features/profile/presentation/views/widgets/account_information_item.dart';

class AccountInformationDetailsBody extends StatelessWidget {
  const AccountInformationDetailsBody({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        AccountInformationItem(
          icon: Icon(Icons.person, size: 28),
          title: 'Name',
          value: user.firstName,
        ),
        AccountInformationItem(
          icon: Icon(Icons.mail, size: 28),
          title: 'Email',
          value: user.email,
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.phone),
          title: 'Phone',
          value: user.phone,
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.marsAndVenus),
          title: 'Gender',
          value: user.gender,
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.marsAndVenus),
          title: 'My Favorites',
          onTap: () => context.push(AppRoute.kMyFavoritesView),
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.signOutAlt, color: AppColor.red),
          title: 'Sign Out',
          textColor: AppColor.red,
          onTap: () {
            CustomDialog.showConfirmationDialog(
              context: context,
              title: 'Sign Out',
              message: 'Are you sure you want to sign out?',
              onConfirm: () => context.read<SignOutCubit>().logout(),
            );
          },
        ),
      ],
    );
  }
}
