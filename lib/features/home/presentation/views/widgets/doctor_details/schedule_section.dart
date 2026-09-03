import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_item_grid_view.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
    this.hasError = false,
  });
  final List<DoctorAvailabilityEntity> slots;
  final DoctorAvailabilityEntity? selectedSlot;
  final ValueChanged<DoctorAvailabilityEntity> onSlotSelected;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasError ? const EdgeInsets.all(12) : EdgeInsets.zero,
      decoration: hasError
          ? BoxDecoration(
              border: Border.all(color: AppColor.red, width: 1.4),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Schedule', style: TextStyles.font18Bold),
          const SizedBox(height: 16),
          ScheduleItemGridView(
            slots: slots,
            selectedSlot: selectedSlot,
            onSlotSelected: onSlotSelected,
          ),
        ],
      ),
    );
  }
}
