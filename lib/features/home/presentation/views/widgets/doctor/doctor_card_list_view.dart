import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card.dart';

class DoctorCardListView extends StatelessWidget {
  const DoctorCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (contexy, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: const DoctorCard(),
        );
      },
    );
  }
}
