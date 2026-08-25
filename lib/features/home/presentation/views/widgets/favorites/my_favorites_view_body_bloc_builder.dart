import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/favorites/my_favorites_view_body.dart';

class MyFavoritesViewBodyBlocBuilder extends StatefulWidget {
  const MyFavoritesViewBodyBlocBuilder({super.key});

  @override
  State<MyFavoritesViewBodyBlocBuilder> createState() =>
      _MyFavoritesViewBodyBlocBuilderState();
}

class _MyFavoritesViewBodyBlocBuilderState
    extends State<MyFavoritesViewBodyBlocBuilder> {
  bool isClearAllChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, favoriteState) {
        return BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, doctorState) {
            final favoriteDoctors =
                favoriteState is FavoriteLoaded && doctorState is DoctorSuccess
                ? doctorState.doctorEntity
                      .where(
                        (doctor) => favoriteState.doctorIds.contains(doctor.id),
                      )
                      .toList()
                : null;

            return MyFavoritesViewBody(
              isLoading:
                  favoriteState is FavoriteLoading ||
                  doctorState is DoctorLoading,
              errorMessage: favoriteState is FavoriteFailure
                  ? favoriteState.errMessage
                  : doctorState is DoctorFailure
                  ? doctorState.errMessage
                  : null,
              favoriteDoctors: favoriteDoctors,
              isClearAllChecked: isClearAllChecked,
              onClearAllTap: () => _confirmClearAll(context),
            );
          },
        );
      },
    );
  }

  void _confirmClearAll(BuildContext context) {
    setState(() => isClearAllChecked = !isClearAllChecked);
    final favoriteCubit = context.read<FavoriteCubit>();
    CustomDialog.showConfirmationDialog(
      context: context,
      title: 'Delete All Doctors',
      message: 'Are you sure you want to Delete all Favorite Doctors?',
      confirmText: 'Delete',
      confirmColor: AppColor.primary,
      onConfirm: () {
        favoriteCubit.clearAllFavorites();
        setState(() => isClearAllChecked = false);
      },
      onCancel: () => setState(() => isClearAllChecked = false),
    );
  }
}
