import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorName extends StatelessWidget {
  const DoctorName({super.key, this.textStyle, required this.doctorEntity});
  final TextStyle? textStyle;
  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Text(
      doctorEntity.name,
      style:
          textStyle ??
          TextStyles.font14SemiBold.copyWith(color: const Color(0xFF32384B)),
    );
  }
}
