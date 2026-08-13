import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/doctor_info_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_rating.dart';
import 'package:medico/features/home/presentation/views/widgets/doctors_info_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: doctorInfoAppBar(context),
      body: DoctorDetailsViewBody(),
      bottomSheet: DoctorInfoBottomSheet(),
    );
  }
}

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
                  DoctorRating(),
                ],
              ),
              DoctorInfo(),
            ],
          ),
        ],
      ),
    );
  }
}
