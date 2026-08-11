import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_card_grid_view.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_header.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_card_sliver_list.dart';

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
                  context.push(AppRoute.kCategoriesView);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        const CustomCardGridview(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CustomHeader(title1: 'Find Doctors'),
              const SizedBox(height: 24),
            ],
          ),
        ),
        const DoctorCardSliverList(),
      ],
    );
  }
}
