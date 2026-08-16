import 'package:flutter/material.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_overview.dart';

class DoctorOverviewSection extends StatelessWidget {
  const DoctorOverviewSection({super.key, required this.doctorEntity});

  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    final items = [
      DoctorOverviewItem(
        title: 'Experience',
        value: '${doctorEntity.experience}yr',
      ),
      DoctorOverviewItem(title: 'Treated', value: '${doctorEntity.treated}+'),
      DoctorOverviewItem(
        title: 'Hourly Rate',
        value: '\$${doctorEntity.hourlyRate.toStringAsFixed(2)}',
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }
}
