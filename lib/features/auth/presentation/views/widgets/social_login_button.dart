import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.image, this.onTap});
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: ShapeDecoration(
          color: const Color(0xFFF4F4F6),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(
          image,
          height: 24,
          width: 24,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
