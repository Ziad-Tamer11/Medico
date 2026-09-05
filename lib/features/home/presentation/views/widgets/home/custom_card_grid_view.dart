import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/doctors/domain/entities/category_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_card.dart';

class CustomCardGridview extends StatelessWidget {
  const CustomCardGridview({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      sliver: SliverGrid.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 72,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CustomCard(
            categoryEntity: category,
            onTap: () {
              context.push(AppRoute.kDoctorsByCategoryView, extra: category);
            },
          );
        },
      ),
    );
  }
}
