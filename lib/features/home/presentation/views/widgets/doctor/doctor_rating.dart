import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorRating extends StatelessWidget {
  const DoctorRating({super.key, this.textStyle, required this.doctorEntity});
  final TextStyle? textStyle;
  final DoctorEntity doctorEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${doctorEntity.rating}',
          style: textStyle ?? TextStyles.font14Medium,
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Assets.imagesStar),
      ],
    );
  }
}
