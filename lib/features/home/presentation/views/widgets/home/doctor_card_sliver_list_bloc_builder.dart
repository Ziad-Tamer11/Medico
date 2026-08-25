import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card_sliver_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Home only ever shows a varied preview of doctors; the full list lives on
// AllDoctorsView ("See All"), which fetches independently and is untouched
// by this limit.
const _homeDoctorsLimit = 20;
const _homeDoctorsPerCategoryLimit = 2;

class DoctorCardSliverListBlocBuilder extends StatelessWidget {
  const DoctorCardSliverListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return Skeletonizer.sliver(
            child: DoctorCardSliverList(doctors: getDummyDoctors()),
          );
        }
        if (state is DoctorFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }
        if (state is DoctorSuccess) {
          return DoctorCardSliverList(
            doctors: _pickHomePreview(state.doctorEntity),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  // Picks up to _homeDoctorsPerCategoryLimit doctors from each category so
  // the Home preview isn't dominated by whichever category has the most
  // doctors, capped at _homeDoctorsLimit overall.
  List<DoctorEntity> _pickHomePreview(List<DoctorEntity> doctors) {
    final perCategoryCount = <int, int>{};
    final preview = <DoctorEntity>[];
    for (final doctor in doctors) {
      if (preview.length >= _homeDoctorsLimit) break;
      final countForCategory = perCategoryCount[doctor.categoryId] ?? 0;
      if (countForCategory >= _homeDoctorsPerCategoryLimit) continue;
      preview.add(doctor);
      perCategoryCount[doctor.categoryId] = countForCategory + 1;
    }
    return preview;
  }
}
