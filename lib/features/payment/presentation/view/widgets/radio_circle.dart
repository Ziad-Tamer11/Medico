import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medico/core/utils/app_colors.dart';

class RadioCircle extends StatelessWidget {
  const RadioCircle({required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColor.primary : Colors.transparent,
        border: Border.all(
          color: isActive ? AppColor.primary : AppColor.grey,
          width: 1.4,
        ),
      ),
      child: isActive
          ? const Icon(Icons.check, size: 14, color: AppColor.white)
          : null,
    );
  }
}
