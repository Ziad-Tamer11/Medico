import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_card_grid_view.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_header.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const CustomAppBar(),
          const SizedBox(height: 40),
          const CustomHeader(title1: 'Categories'),
          const SizedBox(height: 24),
          const CustomCardGridview(),
          const SizedBox(height: 40),
          const CustomHeader(title1: 'Find Doctors'),
          const SizedBox(height: 24),
          const DoctorCard(),
        ],
      ),
    );
  }
}
