import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.font24Bold);
  }
}
