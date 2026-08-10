import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorAvailability extends StatelessWidget {
  const DoctorAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesTime),
        const SizedBox(width: 8),
        Text(
          '10:30am - 5:30pm',
          style: TextStyles.font14Medium.copyWith(
            color: const Color(0xFF32384B),
          ),
        ),
      ],
    );
  }
}
