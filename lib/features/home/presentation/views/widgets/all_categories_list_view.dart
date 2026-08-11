import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/all_categories_card.dart';

class AllCategoriesListView extends StatelessWidget {
  const AllCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AllCategoriesCard(),
        );
      },
    );
  }
}
