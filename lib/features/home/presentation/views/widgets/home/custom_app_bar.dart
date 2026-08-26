import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

class CustomAppBarBody extends StatelessWidget {
  const CustomAppBarBody({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(Assets.imagesUser, height: 40),
        title: Text(
          'Welcome Back',
          style: TextStyles.font14Regular.copyWith(
            color: const Color(0xFF7D8994),
          ),
        ),
        subtitle: Text(
          user.fullName,
          style: TextStyles.font16Medium.copyWith(color: AppColor.black),
        ),
        trailing: Row(
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => context.push(AppRoute.kNotificationsView),
              child: SvgPicture.asset(Assets.imagesNotification),
            ),
            GestureDetector(
              onTap: () => context.push(AppRoute.kMyFavoritesView),
              child: SvgPicture.asset(Assets.imagesFavorite),
            ),
          ],
        ),
      ),
    );
  }
}
