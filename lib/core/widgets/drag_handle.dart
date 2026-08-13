import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 32),
      width: 64,
      height: 5,
      decoration: BoxDecoration(
        color: AppColor.divider,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
