import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_images.dart';

// Doctor images come from the backend as PNG URLs; falls back to the
// bundled placeholder if a doctor has none, and shows nothing if the URL
// fails to load rather than a broken-image icon.
class DoctorImage extends StatelessWidget {
  const DoctorImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return Image.asset(
        Assets.imagesDoctorProfile,
        width: width,
        height: height,
        fit: fit,
      );
    }
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return SizedBox(width: width, height: height);
      },
      errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
    );
  }
}
