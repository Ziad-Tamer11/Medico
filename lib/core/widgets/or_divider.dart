import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFF4F4F6), thickness: 2)),
        SizedBox(width: 16),
        Text(
          'Or',
          textAlign: TextAlign.center,
          style: TextStyles.font14Regular,
        ),
        SizedBox(width: 16),
        Expanded(child: Divider(color: Color(0xFFF4F4F6), thickness: 2)),
      ],
    );
  }
}
