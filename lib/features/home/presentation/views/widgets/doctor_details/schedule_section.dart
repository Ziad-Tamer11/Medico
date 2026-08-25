import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_item_grid_view.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
  });
  final List<DoctorAvailabilityEntity> slots;
  final DoctorAvailabilityEntity? selectedSlot;
  final ValueChanged<DoctorAvailabilityEntity> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
