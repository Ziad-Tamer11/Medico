import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorRating extends StatelessWidget {
  const DoctorRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '4.8',
          style: TextStyles.font14Medium.copyWith(
            color: const Color(0xFF32384B),
          ),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Assets.imagesStar),
      ],
    );
  }
}
