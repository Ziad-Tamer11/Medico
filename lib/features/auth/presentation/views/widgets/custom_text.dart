import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Text(text, style: TextStyles.font16Medium),
    );
  }
}
