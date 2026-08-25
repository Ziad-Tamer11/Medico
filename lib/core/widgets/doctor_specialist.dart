import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorSpecialist extends StatelessWidget {
  const DoctorSpecialist({
    super.key,
    this.textStyle,
    required this.doctorEntity,
    this.showWorkPlace = true,
  });

  final TextStyle? textStyle;
  final DoctorEntity doctorEntity;
  final bool showWorkPlace;

  @override
  Widget build(BuildContext context) {
    final workPlace = doctorEntity.workPlace;
    final text = showWorkPlace && workPlace != null
        ? '${doctorEntity.specialty} | $workPlace'
        : doctorEntity.specialty;
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style:
          textStyle ??
          TextStyles.font14Regular.copyWith(color: const Color(0xFFAAB5C3)),
    );
  }
}
