import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/drag_handle.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_info_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_overview_list.dart';

class DoctorInfoBottomSheet extends StatelessWidget {
  const DoctorInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
          DragHandle(),
          DoctorInfoSection(),
          const SizedBox(height: 24),
          Divider(color: AppColor.blueGrey),
          const SizedBox(height: 24),
          DoctorOverviewSection(),
          const SizedBox(height: 24),
          SelectDateSection(),
        ],
      ),
    );
  }
}

class SelectDateSection extends StatelessWidget {
  const SelectDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: TextStyles.font18Bold),
        const SizedBox(height: 24),
      ],
    );
  }
}
