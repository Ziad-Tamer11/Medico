import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/navigation/custom_bottom_navigation_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/navigation/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainViewBody(currentViewIndex: currentViewIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
