import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/drag_handle.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_info_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_overview_list.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/select_date_section.dart';

class DoctorInfoBottomSheet extends StatefulWidget {
  const DoctorInfoBottomSheet({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;

  @override
  State<DoctorInfoBottomSheet> createState() => _DoctorInfoBottomSheetState();
}

class _DoctorInfoBottomSheetState extends State<DoctorInfoBottomSheet> {
  DateTime? selectedDate;
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .61,
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
          DoctorInfoSection(doctorEntity: widget.doctorEntity),
          const SizedBox(height: 24),
          Divider(color: AppColor.blueGrey),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  DoctorOverviewSection(doctorEntity: widget.doctorEntity),
                  const SizedBox(height: 24),
                  const SelectDateSection(),
                  const SizedBox(height: 24),
                  ScheduleSection(doctorEntity: widget.doctorEntity),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: 'Book Appointment',
                    onPressed: () {
                      context.push(
                        AppRoute.kAppointmentDetailsView,
                        extra: widget.doctorEntity,
                      );
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
