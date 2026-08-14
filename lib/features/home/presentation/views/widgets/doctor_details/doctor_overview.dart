import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorOverviewItem extends StatelessWidget {
  const DoctorOverviewItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          spacing: 4,
          children: [
            Text(value, style: TextStyles.font16Bold),
            Text(title, style: TextStyles.font16Regular),
          ],
        ),
      ],
    );
  }
}
