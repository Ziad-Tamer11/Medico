import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_card.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomAppBar(),
        ),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomHeader(title1: 'Categories', title2: 'See all'),
        ),
        const SizedBox(height: 24),
        CustomCard(),
      ],
    );
  }
}
