import 'package:flutter/material.dart';
import 'package:medico/core/helpers/get_dummy_category.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card_list_view.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Pure UI: the list area of My Favorites — loading skeleton, error, empty
// state, or the actual favorite doctors.
class FavoriteDoctorsContent extends StatelessWidget {
  const FavoriteDoctorsContent({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.favoriteDoctors,
  });

  final bool isLoading;
  final String? errorMessage;
  final List<DoctorEntity>? favoriteDoctors;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Skeletonizer(
        child: DoctorCardListView(doctors: getDummyDoctors()),
      );
    }
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }
    final doctors = favoriteDoctors ?? [];
    if (doctors.isEmpty) {
      return const NoResult(text: 'No favorite doctors found');
    }
    return DoctorCardListView(doctors: doctors);
  }
}
