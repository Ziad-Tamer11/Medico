import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/get_user.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/profile/presentation/views/widgets/account_information_item.dart';

class AccountInformationDetails extends StatelessWidget {
  const AccountInformationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return Column(
      spacing: 30,
      children: [
        AccountInformationItem(
          icon: Icon(Icons.person, size: 28),
          title: 'Name',
          value: user.name,
        ),
        AccountInformationItem(
          icon: Icon(Icons.mail, size: 28),
          title: 'Email',
          value: user.email,
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.phone),
          title: 'Phone',
          value: '01012345678',
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.marsAndVenus),
          title: 'Gender',
          value: 'Male',
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.marsAndVenus),
          title: 'My Favorites',
          onTap: () {
            context.push(AppRoute.kMyFavoritesView);
          },
        ),
        AccountInformationItem(
          icon: FaIcon(FontAwesomeIcons.signOutAlt, color: AppColor.red),
          title: 'Sign Out',
          textColor: AppColor.red,
          onTap: () {},
        ),
      ],
    );
  }
}
