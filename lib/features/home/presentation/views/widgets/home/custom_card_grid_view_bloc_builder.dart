import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_card_grid_view.dart';

class CustomCardGridViewBlocBuilder extends StatelessWidget {
  const CustomCardGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is CategoryFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }

        if (state is CategorySuccess) {
          return CustomCardGridview(categories: state.categories);
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
