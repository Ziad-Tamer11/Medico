import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title1, required this.title2});
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title1,
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        Spacer(),
        Text(
          title2,
          style: TextStyles.font16Medium.copyWith(color: AppColor.primary),
        ),
      ],
    );
  }
}
