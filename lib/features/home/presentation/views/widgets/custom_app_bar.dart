import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(Assets.imagesProfileAvatar),
        title: Text(
          'Welcome Back',
          style: TextStyles.font14Regular.copyWith(
            color: const Color(0xFF7D8994),
          ),
        ),
        subtitle: Text(
          'Andrew Smith',
          style: TextStyles.font16Medium.copyWith(color: AppColor.black),
        ),
        trailing: Row(
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(Assets.imagesNotification),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(Assets.imagesFavorite),
            ),
          ],
        ),
      ),
    );
  }
}
