import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/home/domain/usecases/category_usecase.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/categories/all_categories_view_body.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'All Categories'),
      body: BlocProvider(
        create: (context) =>
            CategoryCubit(categoryUsecase: getIt<CategoryUsecase>())
              ..getCategories(),
        child: AllCategoriesViewBody(),
      ),
    );
  }
}
