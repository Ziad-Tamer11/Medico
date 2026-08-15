import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_card_grid_view.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_header.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card_sliver_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const CustomAppBar(),
              const SizedBox(height: 40),
              CustomHeader(
                title1: 'Categories',
                onTap: () {
                  context.push(AppRoute.kAllCategoriesView);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        CustomCardGridviewBlocBuilder(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 40),
              CustomHeader(
                title1: 'Find Doctors',
                onTap: () {
                  context.push(AppRoute.kAllDoctorsView);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        const DoctorCardSliverList(),
      ],
    );
  }
}

class CustomCardGridviewBlocBuilder extends StatelessWidget {
  const CustomCardGridviewBlocBuilder({super.key});

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
