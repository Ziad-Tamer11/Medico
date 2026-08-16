import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorAvailability extends StatelessWidget {
  const DoctorAvailability({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesTime),
        const SizedBox(width: 8),
        Text(
          doctorEntity.availableHours.first,
          style: TextStyles.font14Medium.copyWith(
            color: const Color(0xFF32384B),
          ),
        ),
      ],
    );
  }
}
