import 'package:flutter/material.dart';
import 'package:medico/features/home/domain/entities/buttom_navigation_bar_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/navigation/active_items.dart';
import 'package:medico/features/home/presentation/views/widgets/navigation/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
            text: bottomNavigationBarEntity.name,
          );
  }
}
