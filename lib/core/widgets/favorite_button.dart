import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';

// Pure UI: same heart icon everywhere, swaps to the filled asset when favorited.
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
    this.size = 24,
  });

  final bool isFavorite;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        isFavorite ? Assets.imagesFavoriteSelected : Assets.imagesFavorite,
        width: size,
        height: size,
        color: AppColor.red,
      ),
    );
  }
}
