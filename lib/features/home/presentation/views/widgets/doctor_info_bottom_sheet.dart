import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/drag_handle.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_info_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_overview_list.dart';
import 'package:medico/features/home/presentation/views/widgets/schedule_section.dart';
import 'package:medico/features/home/presentation/views/widgets/select_date_section.dart';

class DoctorInfoBottomSheet extends StatelessWidget {
  const DoctorInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const DoctorOverviewSection(),
                  const SizedBox(height: 24),
                  const SelectDateSection(),
                  const SizedBox(height: 24),
                  const ScheduleSection(),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: 'Book Appointment',
                    onPressed: () {
                      context.push(AppRoute.kAppointmentDetailsView);
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
