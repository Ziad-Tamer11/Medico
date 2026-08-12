import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/home_view.dart';
import 'package:medico/features/search/presentation/views/search_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [HomeView(), Placeholder(), SearchView(), Placeholder()],
    );
  }
}
