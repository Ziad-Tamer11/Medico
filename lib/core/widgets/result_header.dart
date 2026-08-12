import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          text ?? 'Results',
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
