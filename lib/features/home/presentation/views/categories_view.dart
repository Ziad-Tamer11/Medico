import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'All Categories'),
      body: CategoriesViewBody(),
    );
  }
}
