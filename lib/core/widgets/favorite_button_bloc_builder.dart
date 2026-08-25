import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/widgets/favorite_button.dart';
import 'package:medico/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';

class FavoriteButtonBlocBuilder extends StatelessWidget {
  const FavoriteButtonBlocBuilder({
    super.key,
    required this.doctorId,
    this.size = 24,
  });

  final int doctorId;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavorite =
            state is FavoriteLoaded && state.doctorIds.contains(doctorId);
        return FavoriteButton(
          isFavorite: isFavorite,
          size: size,
          onTap: () => context.read<FavoriteCubit>().toggleFavorite(doctorId),
        );
      },
    );
  }
}
