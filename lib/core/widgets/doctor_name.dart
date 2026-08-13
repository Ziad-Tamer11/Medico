import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorName extends StatelessWidget {
  const DoctorName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Jennifer Miller',
      style: TextStyles.font14SemiBold.copyWith(color: const Color(0xFF32384B)),
    );
  }
}
