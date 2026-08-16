import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorSpecialist extends StatelessWidget {
  const DoctorSpecialist({
    super.key,
    this.textStyle,
    required this.doctorEntity,
  });
  final TextStyle? textStyle;
  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${doctorEntity.specialization} | ${doctorEntity.workPlace}',
      style:
          textStyle ??
          TextStyles.font14Regular.copyWith(color: const Color(0xFFAAB5C3)),
    );
  }
}
