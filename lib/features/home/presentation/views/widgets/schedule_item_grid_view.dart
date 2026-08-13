import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/schedule_available_item.dart';

class ScheduleItemGridView extends StatefulWidget {
  const ScheduleItemGridView({super.key});

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
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 44,
      ),
      itemBuilder: (context, index) {
        return ScheduleAvailableItem(
          isSelected: selectedIndex == index,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
    );
  }
}
