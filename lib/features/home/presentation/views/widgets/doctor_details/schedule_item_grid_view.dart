import 'package:flutter/material.dart';
import 'package:medico/core/helpers/format_time_12h.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_available_item.dart';

class ScheduleItemGridView extends StatelessWidget {
  const ScheduleItemGridView({
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
    if (slots.isEmpty) {
      return Text(
        'No available times for this date',
        style: TextStyles.font14Regular,
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: slots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 44,
      ),
      itemBuilder: (context, index) {
        final slot = slots[index];
        return ScheduleAvailableItem(
          time:
              '${formatTime12h(slot.startTime)} - ${formatTime12h(slot.endTime)}',
          isSelected: selectedSlot == slot,
          isDisabled: !slot.isAvailable,
          onTap: () => onSlotSelected(slot),
        );
      },
    );
  }
}
