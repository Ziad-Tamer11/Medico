import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jennifer Miller',
          style: TextStyles.font14SemiBold.copyWith(
            color: const Color(0xFF32384B),
          ),
        ),
        Text(
          'Pediatrician | Mercy Hospital',
          style: TextStyles.font14Regular.copyWith(
            color: const Color(0xFFAAB5C3),
          ),
        ),
      ],
    );
  }
}
