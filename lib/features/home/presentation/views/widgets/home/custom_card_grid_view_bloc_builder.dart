import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_card_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Home only ever shows a preview of the categories; the full list lives on
// AllCategoriesView ("See All"), which fetches independently and is untouched
// by this limit.
const _homeCategoriesLimit = 6;

class CustomCardGridViewBlocBuilder extends StatelessWidget {
  const CustomCardGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Skeletonizer.sliver(
            child: CustomCardGridview(categories: getDummyCategories()),
          );
        }
        if (state is CategoryFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }
        if (state is CategorySuccess) {
          return CustomCardGridview(
            categories: state.categories.take(_homeCategoriesLimit).toList(),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
