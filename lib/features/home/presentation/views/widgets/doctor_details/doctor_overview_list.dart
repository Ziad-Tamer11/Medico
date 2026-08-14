import 'package:flutter/material.dart';
import 'package:medico/features/home/domain/entities/doctor_overview_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_overview.dart';

class DoctorOverviewSection extends StatelessWidget {
  const DoctorOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = DoctorOverviewItemEntity.getItems();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(items.length, (index) {
        final item = items[index];

        return DoctorOverviewItem(title: item.title, value: item.value);
      }),
    );
  }
}
