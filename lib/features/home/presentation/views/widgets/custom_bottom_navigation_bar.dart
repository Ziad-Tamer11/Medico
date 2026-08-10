import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/features/home/domain/entities/buttom_navigation_bar_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(color: AppColor.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomNavigationBarItems.map((e) {
          return NavigationBarItem(
            isSelected: false,
            bottomNavigationBarEntity: e,
          );
        }).toList(),
      ),
    );
  }
}
