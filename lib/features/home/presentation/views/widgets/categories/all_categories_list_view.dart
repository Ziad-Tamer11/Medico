import 'package:flutter/material.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/categories/all_categories_card.dart';

class AllCategoriesListView extends StatelessWidget {
  const AllCategoriesListView({super.key, required this.categories});
  final List<CategoryEntity> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AllCategoriesCard(categoryEntity: categories[index]),
        );
      },
    );
  }
}
