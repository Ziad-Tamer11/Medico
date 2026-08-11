import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_card_list_view.dart';

class DoctorsByCategoryViewBody extends StatelessWidget {
  const DoctorsByCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ResultHeader(),
        ),
        Expanded(child: DoctorCardListView()),
      ],
    );
  }
}
