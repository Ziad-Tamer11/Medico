import 'package:flutter/material.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card.dart';

class DoctorCardListView extends StatelessWidget {
  const DoctorCardListView({super.key, required this.doctors});
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (contexy, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DoctorCard(doctorEntity: doctors[index]),
        );
      },
    );
  }
}
