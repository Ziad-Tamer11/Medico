import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_availability.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_rating.dart';

class DoctorInfoBottomSheet extends StatelessWidget {
  const DoctorInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 64,
            height: 8,
            decoration: BoxDecoration(
              color: AppColor.divider,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              Row(
                children: [
                  Text('David H. Brown', style: TextStyles.font18Bold),
                  Spacer(),
                  DoctorRating(textStyle: TextStyles.font14SemiBold),
                ],
              ),
              DoctorAvailability(),
            ],
          ),
        ],
      ),
    );
  }
}
