import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_card_grid_view.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        CustomAppBar(),
        SizedBox(height: 40),
        CustomHeader(title1: 'Categories', title2: 'See all'),
        SizedBox(height: 24),
        Expanded(child: CustomCardGridview()),
      ],
    );
  }
}
