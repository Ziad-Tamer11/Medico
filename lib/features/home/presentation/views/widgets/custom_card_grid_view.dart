import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_card.dart';

class CustomCardGridview extends StatelessWidget {
  const CustomCardGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      sliver: SliverGrid.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 72,
        ),
        itemBuilder: (context, index) {
          return CustomCard(
            onTap: () {
              context.push(AppRoute.kDoctorsByCategoryView);
            },
          );
        },
      ),
    );
  }
}
