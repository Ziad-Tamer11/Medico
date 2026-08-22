import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_app_bar_bloc_builder.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_card_grid_view_bloc_builder.dart';
import 'package:medico/features/home/presentation/views/widgets/home/custom_header.dart';
import 'package:medico/features/home/presentation/views/widgets/home/doctor_card_sliver_list_bloc_builder.dart';

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
              const CustomAppBarBlocBuilder(),
              const SizedBox(height: 40),
              //! UpcomingAppointmentSectionBlocBuilder(),
              //! const SizedBox(height: 24),
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
        CustomCardGridViewBlocBuilder(),
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
        DoctorCardSliverListBlocBuilder(),
      ],
    );
  }
}
