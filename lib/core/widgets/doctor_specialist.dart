import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorSpecialist extends StatelessWidget {
  const DoctorSpecialist({super.key, this.textStyle});
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Pediatrician | Mercy Hospital',
      style:
          textStyle ??
          TextStyles.font14Regular.copyWith(color: const Color(0xFFAAB5C3)),
    );
  }
}
