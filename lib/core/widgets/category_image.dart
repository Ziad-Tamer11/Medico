import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';

// Category images come from the backend as SVG URLs; falls back to the
// bundled placeholder icon if a category has none.
class CategoryImage extends StatelessWidget {
  const CategoryImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return SvgPicture.asset(Assets.imagesHeart, width: width, height: height);
    }
    return SvgPicture.network(
      url,
      width: width,
      height: height,
      placeholderBuilder: (context) => SizedBox(width: width, height: height),
      errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
    );
  }
}
