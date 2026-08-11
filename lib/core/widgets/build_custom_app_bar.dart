import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

AppBar buildCustomAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        title,
        style: TextStyles.font18Bold.copyWith(color: AppColor.black),
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          InkWell(
            onTap: context.pop,
            child: SvgPicture.asset(Assets.imagesBackArrow),
          ),
        ],
      ),
    ),
  );
}
