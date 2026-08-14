import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';
import 'package:medico/features/home/presentation/views/widgets/categories/all_categories_list_view.dart';

class AllCategoriesViewBody extends StatelessWidget {
  const AllCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ResultHeader(),
          Expanded(child: const AllCategoriesListView()),
        ],
      ),
    );
  }
}
