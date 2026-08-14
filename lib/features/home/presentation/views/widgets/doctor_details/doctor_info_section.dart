import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/doctor_name.dart';
import 'package:medico/core/widgets/doctor_specialist.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_availability.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_rating.dart';

class DoctorInfoSection extends StatelessWidget {
  const DoctorInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DoctorName(textStyle: TextStyles.font18Bold),
            Spacer(),
            DoctorRating(textStyle: TextStyles.font14SemiBold),
          ],
        ),
        DoctorSpecialist(
          textStyle: TextStyles.font16Regular.copyWith(
            color: const Color(0xFFAAB5C3),
          ),
        ),
        DoctorAvailability(),
      ],
    );
  }
}
