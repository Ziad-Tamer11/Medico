import 'package:flutter/material.dart';
import 'package:medico/core/widgets/doctor_name.dart';
import 'package:medico/core/widgets/doctor_specialist.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctorName(doctorEntity: doctorEntity),
        DoctorSpecialist(doctorEntity: doctorEntity),
      ],
    );
  }
}
