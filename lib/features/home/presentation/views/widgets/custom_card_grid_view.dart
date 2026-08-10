import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_card.dart';

class CustomCardGridview extends StatelessWidget {
  const CustomCardGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 72,
      ),
      itemBuilder: (context, index) {
        return CustomCard();
      },
    );
  }
}
