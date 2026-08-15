import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
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
          Expanded(child: AllCategoriesViewBodyBlocBuilder()),
        ],
      ),
    );
  }
}

class AllCategoriesViewBodyBlocBuilder extends StatelessWidget {
  const AllCategoriesViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return AllCategoriesListView(categories: state.categories);
        }
        if (state is CategoryFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is CategoryLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
