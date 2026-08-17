import 'package:flutter/material.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_available_item.dart';

class ScheduleItemGridView extends StatefulWidget {
  const ScheduleItemGridView({
    super.key,
    required this.doctorEntity,
    required this.onTimeSelected,
  });
  final DoctorEntity doctorEntity;
  final ValueChanged<String> onTimeSelected;

  @override
  State<ScheduleItemGridView> createState() => _ScheduleItemGridViewState();
}

class _ScheduleItemGridViewState extends State<ScheduleItemGridView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.doctorEntity.availableHours.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 44,
      ),
      itemBuilder: (context, index) {
        final time = widget.doctorEntity.availableHours[index];
        return ScheduleAvailableItem(
          time: time,
          isSelected: selectedIndex == index,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onTimeSelected(time);
          },
        );
      },
    );
  }
}
