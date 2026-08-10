import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/features/home/domain/entities/buttom_navigation_bar_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(color: AppColor.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.onItemTapped(index);
              });
            },
            child: NavigationBarItem(
              isSelected: selectedIndex == index,
              bottomNavigationBarEntity: entity,
            ),
          );
        }).toList(),
      ),
    );
  }
}
