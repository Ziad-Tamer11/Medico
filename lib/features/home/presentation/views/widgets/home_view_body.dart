import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomAppBar(),
        ),
      ],
    );
  }
}
