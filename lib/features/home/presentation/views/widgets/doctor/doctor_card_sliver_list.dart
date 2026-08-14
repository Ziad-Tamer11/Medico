import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card.dart';

class DoctorCardSliverList extends StatelessWidget {
  const DoctorCardSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (contexy, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: const DoctorCard(),
        );
      },
    );
  }
}
