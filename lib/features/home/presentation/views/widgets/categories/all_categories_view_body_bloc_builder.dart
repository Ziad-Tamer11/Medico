import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/doctors/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/categories/all_categories_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllCategoriesViewBodyBlocBuilder extends StatelessWidget {
  const AllCategoriesViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Skeletonizer(
            enabled: true,
            child: AllCategoriesListView(categories: getDummyCategories()),
          );
        }

        if (state is CategoryFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is CategorySuccess) {
          return AllCategoriesListView(categories: state.categories);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
