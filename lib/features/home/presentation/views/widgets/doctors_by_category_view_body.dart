import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';

class DoctorsByCategoryViewBody extends StatelessWidget {
  const DoctorsByCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: const Column(children: [ResultHeader()]),
    );
  }
}
